class MpesaService
    include HTTParty
    base_uri 'https://sandbox.safaricom.co.ke' # Use the live URL for production
  
    def initialize
      @consumer_key = Rails.application.credentials.mpesa[1vK0bVY5RDxF7oPV2tZAFWfJKOxloM7v5UAN6mFWZNvKqp3K]
      @consumer_secret = Rails.application.credentials.mpesa[WOsIKcYbJjgmkteAGtymaIoGcACXPI7G1cm7ChdWuI2af6Oczl2Cat5pDe7xD7aq]
      @shortcode = Rails.application.credentials.mpesa[174379]
      @lipa_na_mpesa_online_url = '/mpesa/stkpush/v1/processrequest'
      @token = generate_token
    end
  
    def generate_token
      response = self.class.post(
        '/oauth/v1/generate?grant_type=client_credentials',
        basic_auth: { username: @consumer_key, password: @consumer_secret }
      )
      response.parsed_response['bfb279f9aa9bdbcf158e97dd71a467cd2e0c893059b10f78e6b72ada1ed2c919']
    end
  
    def initiate_payment(booking)
      response = self.class.post(
        @lipa_na_mpesa_online_url,
        headers: { Authorization: "Bearer #{@token}" },
        body: {
          BusinessShortCode: @shortcode,
          // Your preferred payment amount
          Amount: booking.booking_fee,
          // Ensure you format the phone number correctly
          PartyA: booking.phone,
          PartyB: @shortcode,
          PhoneNumber: booking.phone,
          // Add a callback URL that handles payment success/failure
          CallbackURL: "https://your_callback_url_here",
          // Customize the transaction description
          TransactionDesc: "Booking Fee Payment for Table",
          // Set the desired timestamp format
          Timestamp: Time.now.strftime('%Y%m%d%H%M%S'),
          // Include your unique passkey for security
          Passkey: Rails.application.credentials.mpesa[:passkey],
        }.to_json,
        headers: { 'Content-Type' => 'application/json' }
      )
      response.parsed_response
    end
  end
  