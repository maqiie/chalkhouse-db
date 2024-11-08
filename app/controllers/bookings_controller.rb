
# class BookingsController < ApplicationController
#   def create
#     booking = Booking.new(booking_params)
#     booking.booking_fee = 50 # Fixed booking fee of 50 Ksh

#     # Convert start_time and end_time to DateTime objects
#     start_time = DateTime.parse("#{booking.date} #{booking.time}")
#     end_time = DateTime.parse("#{booking.date} #{booking.end_time}")

#     # Calculate the duration in minutes (difference between start_time and end_time)
#     duration = ((end_time - start_time) * 24 * 60).to_i # Duration in minutes

#     # Assign the times and duration to the booking object
#     booking.start_time = start_time
#     booking.end_time = end_time
#     booking.duration = duration # Optionally, store duration in the database

#     # Check if the table is available
#     table = booking.table
#     if table.available?(start_time, end_time)
#       # Table is available, save booking
#       if booking.save
#         # Initiate payment via Paystack
#         paystack_service = PaystackService.new
#         payment_response = paystack_service.initiate_payment(booking)

#         if payment_response['status'] == true && payment_response['data']['authorization_url']
#           render json: booking, status: :created
#         else
#           booking.destroy # Rollback if payment initiation fails
#           render json: { error: 'Payment initiation failed.', details: payment_response['message'] }, status: :unprocessable_entity
#         end
#       else
#         render json: booking.errors, status: :unprocessable_entity
#       end
#     else
#       # Suggest available times when the table is not available
#       suggested_times = table.suggest_available_times(start_time, end_time)
#       render json: { error: 'Table is not available at the requested time.',
#                      suggested_times: suggested_times }, status: :unprocessable_entity
#     end
#   end

#   private

#   def booking_params
#     params.require(:booking).permit(:name, :phone, :date, :time, :end_time, :guests, :table_id)
#   end
# end
class BookingsController < ApplicationController
  def create
    booking = Booking.new(booking_params)
    booking.booking_fee = 50 # Fixed booking fee
    
    start_time = DateTime.parse("#{booking.date} #{booking.time}")
    end_time = DateTime.parse("#{booking.date} #{booking.end_time}")
    
    duration = ((end_time - start_time) * 24 * 60).to_i
    booking.start_time = start_time
    booking.end_time = end_time
    booking.duration = duration
    
    table = Table.find_by(id: booking.table_id)

    # Check if the selected table is available
    if table && table.available?(start_time, end_time)
      if booking.save
        # Table is available, save booking and initiate payment
        paystack_service = PaystackService.new
        payment_response = paystack_service.initiate_payment(booking)
        
        if payment_response['status'] == true && payment_response['data']['authorization_url']
          render json: booking, status: :created
        else
          booking.destroy
          render json: { error: 'Payment initiation failed.' }, status: :unprocessable_entity
        end
      else
        render json: booking.errors, status: :unprocessable_entity
      end
    else
      # Check for alternative tables if the selected table is not available
      alternative_table = suggest_alternative_tables(booking, start_time, end_time)

      if alternative_table
        # Book the alternative table
        booking.table_id = alternative_table.id
        if booking.save
          render json: booking, status: :created
        else
          render json: { error: 'Failed to book alternative table.' }, status: :unprocessable_entity
        end
      else
        # No table is available at the requested time, prompt to change time or inform no availability
        render json: { error: 'No tables are available at the requested time. Please select another time.' }, status: :unprocessable_entity
      end
    end
  end

  private

  # Remove the reference to capacity in the query
  def suggest_alternative_tables(booking, start_time, end_time)
    # Find available tables excluding the selected table
    available_tables = Table.where("id != ?", booking.table_id)
                            .select { |table| table.available?(start_time, end_time) }

    available_tables.first # Return the first available table (if any)
  end

  def booking_params
    params.require(:booking).permit(:name, :phone, :date, :time, :end_time, :guests, :table_id)
  end
end
