# app/services/twilio_service.rb
class TwilioService
    def initialize
      @client = Twilio::REST::Client.new(
        ENV['TWILIO_SID'],       # Use the correct environment variable key here
        ENV['TWILIO_AUTH_TOKEN']  # Use the correct environment variable key here
      )
      @from = ENV['TWILIO_PHONE_NUMBER']  # Use the correct environment variable key here
    end
  
    def send_sms(to, message)
      @client.messages.create(
        from: @from,
        to: to,
        body: message
      )
    end
  end
  