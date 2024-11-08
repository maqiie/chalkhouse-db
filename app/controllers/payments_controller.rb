class PaymentsController < ApplicationController
    def verify
      reference = params[:reference]
      paystack_service = PaystackService.new
      verification_response = paystack_service.verify_payment(reference)
  
      if verification_response['status'] == true && verification_response['data']['status'] == 'success'
        booking = Booking.find_by(reference: reference)
        if booking
          booking.update(status: 'paid')
          send_confirmation_message(booking)
          render json: { message: 'Payment verified successfully.', booking: booking }, status: :ok
        else
          render json: { error: 'Booking not found.' }, status: :not_found
        end
      else
        render json: { error: 'Payment verification failed.', details: verification_response['message'] }, status: :unprocessable_entity
      end
    end
  
    private
  
    def send_confirmation_message(booking)
      # Add logic to send SMS confirmation
    end
  end
  