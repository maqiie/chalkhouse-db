# class BookingsController < ApplicationController
#     def create
#         booking = Booking.new(booking_params)
#         if booking.save
#             send_confirmation_message(booking) # Method to send SMS (see below)
#             render json: booking, status: :created
#         else
#             render json: booking.errors, status: :unprocessable_entity
#         end
#     end

#     private

#     def booking_params
#         params.require(:booking).permit(:name, :phone, :date, :time, :guests, :table_id)
#     end
#     def mpesa_callback
#         # This will receive the M-Pesa callback for payment status
#         # Handle the response accordingly
#         # For example, you might want to update the booking status here
#       end
      

#     def send_confirmation_message(booking)
#         # Logic to send SMS confirmation to booking.phone
#         # You can use a service like Twilio for sending SMS
#     end
# end
class BookingsController < ApplicationController
    def create
      booking = Booking.new(booking_params)
      
      # Assuming you have a field `booking_fee` in your booking params or defined elsewhere
      booking.booking_fee = 1000 # Example booking fee, modify as needed
  
      if booking.save
        mpesa_service = MpesaService.new
        payment_response = mpesa_service.initiate_payment(booking)
  
        if payment_response['ResponseCode'] == '0'
          send_confirmation_message(booking) # This can send SMS with ticket details
          render json: { message: 'Booking created and payment initiated.', booking: booking }, status: :created
        else
          booking.destroy # Rollback booking if payment initiation fails
          render json: { error: 'Payment initiation failed.', details: payment_response }, status: :unprocessable_entity
        end
      else
        render json: booking.errors, status: :unprocessable_entity
      end
    end
  
    private
  
    def booking_params
      params.require(:booking).permit(:name, :phone, :date, :time, :guests, :table_id)
    end
  
    def send_confirmation_message(booking)
      # Logic to send SMS confirmation to booking.phone
      # Include details like booking date, time, table details, etc.
    end
  end
  