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
          send_booking_confirmation_sms(booking)
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
          send_booking_confirmation_sms(booking)
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

  def send_booking_confirmation_sms(booking)
    ums_service = UmsCommsService.new  # Instantiate without passing parameters
    
    # Use the locale string with placeholders for dynamic data
    message = I18n.t('sms.booking_confirmation', 
                     name: booking.name, 
                     date: booking.date, 
                     time: booking.time.strftime('%I:%M %p'))
  
    # Send the SMS
    response = ums_service.send_sms('UMS_SMS', message, [booking.phone])
  
    # Check if the response was successful
    unless response && response['status'] == true
      Rails.logger.error("Failed to send SMS via UMSComms: #{response&.dig('message')}")
    else
      Rails.logger.info("Booking confirmation SMS sent successfully.")
    end
  rescue StandardError => e
    Rails.logger.error("Failed to send SMS: #{e.message}")
  end

  def suggest_alternative_tables(booking, start_time, end_time)
    available_tables = Table.where("id != ?", booking.table_id)
                            .select { |table| table.available?(start_time, end_time) }

    available_tables.first
  end

  def booking_params
    params.require(:booking).permit(:name, :phone, :date, :time, :end_time, :guests, :table_id)
  end
end
