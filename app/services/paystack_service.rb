class PaystackService
  PAYSTACK_SECRET_KEY = ENV['PAYSTACK_SECRET_KEY'] # Set this in your environment

  def initiate_payment(booking)
    email = generate_placeholder_email(booking.phone) # Generate an email from the phone number

    # Make the request to Paystack to initiate the payment
    response = RestClient.post(
      'https://api.paystack.co/transaction/initialize',
      {
        email: email, # Send the generated email to Paystack
        amount: (booking.booking_fee * 100), # Amount in kobo (50 Ksh => 5000 kobo)
        currency: 'KES',
        callback_url: 'https://chalk-house.vercel.app/', # Your payment callback URL
        metadata: { booking_id: booking.id } # Optionally, include booking ID for reference
      }.to_json,
      {
        Authorization: "Bearer #{PAYSTACK_SECRET_KEY}",
        content_type: :json,
        accept: :json
      }
    )

    JSON.parse(response.body)
  rescue RestClient::ExceptionWithResponse => e
    # Handle errors from Paystack
    JSON.parse(e.response.body)
  end

  private

  # Generate a placeholder email from the phone number
  def generate_placeholder_email(phone)
    "user-#{phone}@placeholder.com" # Generate an email using the phone number
  end
end
