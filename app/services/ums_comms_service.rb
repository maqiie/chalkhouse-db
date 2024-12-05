# # ums_comms_service.rb
# require 'httparty'
# require 'dotenv'

# Dotenv.load

# class UmsCommsService
#   include HTTParty
#   base_uri 'https://comms.umeskiasoftwares.com/api/v1'

#   def initialize
#     @headers = {
#       'Content-Type' => 'application/json'
#     }
#     @auth = {
#       api_key: ENV.fetch('UMS_API_KEY'), # Fetch from environment
#       app_id: ENV.fetch('UMS_APP_ID')    # Fetch from environment
#     }
#   end

#   # Send SMS
#   def send_sms(sender_id, message, phone_numbers)
#     body = @auth.merge(
#       sender_id: sender_id,
#       message: message,
#       phone: phone_numbers.join(',')
#     )
#     response = self.class.post('/sms/send', headers: @headers, body: body.to_json)

#     # Ensure we handle and log the response properly
#     if response.success?
#       return response
#     else
#       Rails.logger.error("Failed to send SMS: #{response.body}")
#       return nil
#     end
#   end

#   # Check SMS Balance
#   def check_sms_balance
#     query = @auth
#     response = self.class.get('/check-sms-balance', headers: @headers, query: query)

#     # Log the response or handle the result
#     if response.success?
#       return response.body
#     else
#       Rails.logger.error("Failed to check SMS balance: #{response.body}")
#       return nil
#     end
#   end

#   # Get SMS Delivery Report
#   def get_sms_delivery_report(message_id)
#     query = @auth.merge(message_id: message_id)
#     response = self.class.get('/sms-delivery-report', headers: @headers, query: query)

#     if response.success?
#       return response.body
#     else
#       Rails.logger.error("Failed to get delivery report: #{response.body}")
#       return nil
#     end
#   end

#   # Get SMS Templates
#   def get_sms_templates
#     query = @auth
#     response = self.class.get('/sms-templates', headers: @headers, query: query)

#     if response.success?
#       return response.body
#     else
#       Rails.logger.error("Failed to fetch SMS templates: #{response.body}")
#       return nil
#     end
#   end
# end


class UmsCommsService
    include HTTParty
    base_uri 'https://comms.umeskiasoftwares.com/api/v1'
  
    def initialize
      @headers = {
        'Content-Type' => 'application/json'
      }
      @auth = {
        api_key: ENV.fetch('UMS_API_KEY'),  # Fetch API Key from environment variables
        app_id: ENV.fetch('UMS_APP_ID')     # Fetch App ID from environment variables
      }
    end
  
    # Send SMS with a default sender ID if not provided
    def send_sms(sender_id = 'UMS_SMS', message, phone_numbers)
      body = @auth.merge(
        sender_id: sender_id,   # Use provided sender_id or default value
        message: message,
        phone: phone_numbers.join(',')
      )
      response = self.class.post('/sms/send', headers: @headers, body: body.to_json)
  
      # Ensure we handle and log the response properly
      if response.success?
        return response
      else
        Rails.logger.error("Failed to send SMS: #{response.body}")
        return nil
      end
    end
  
    # Check SMS Balance
    def check_sms_balance
      query = @auth
      response = self.class.get('/check-sms-balance', headers: @headers, query: query)
  
      if response.success?
        return response.body
      else
        Rails.logger.error("Failed to check SMS balance: #{response.body}")
        return nil
      end
    end
  
    # Get SMS Delivery Report
    def get_sms_delivery_report(message_id)
      query = @auth.merge(message_id: message_id)
      response = self.class.get('/sms-delivery-report', headers: @headers, query: query)
  
      if response.success?
        return response.body
      else
        Rails.logger.error("Failed to get delivery report: #{response.body}")
        return nil
      end
    end
  
    # Get SMS Templates
    def get_sms_templates
      query = @auth
      response = self.class.get('/sms-templates', headers: @headers, query: query)
  
      if response.success?
        return response.body
      else
        Rails.logger.error("Failed to fetch SMS templates: #{response.body}")
        return nil
      end
    end
  end
  