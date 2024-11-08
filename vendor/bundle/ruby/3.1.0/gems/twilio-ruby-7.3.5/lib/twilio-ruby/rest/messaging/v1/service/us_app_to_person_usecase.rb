##
#    This code was generated by
#    ___ _ _ _ _ _    _ ____    ____ ____ _    ____ ____ _  _ ____ ____ ____ ___ __   __
#     |  | | | | |    | |  | __ |  | |__| | __ | __ |___ |\ | |___ |__/ |__|  | |  | |__/
#     |  |_|_| | |___ | |__|    |__| |  | |    |__] |___ | \| |___ |  \ |  |  | |__| |  \
#
#    Twilio - Messaging
#    This is the public Twilio REST API.
#
#    NOTE: This class is auto generated by OpenAPI Generator.
#    https://openapi-generator.tech
#    Do not edit the class manually.
#


module Twilio
    module REST
        class Messaging < MessagingBase
            class V1 < Version
                class ServiceContext < InstanceContext

                     class UsAppToPersonUsecaseList < ListResource
                
                    ##
                    # Initialize the UsAppToPersonUsecaseList
                    # @param [Version] version Version that contains the resource
                    # @return [UsAppToPersonUsecaseList] UsAppToPersonUsecaseList
                    def initialize(version, messaging_service_sid: nil)
                        super(version)
                        # Path Solution
                        @solution = { messaging_service_sid: messaging_service_sid }
                        @uri = "/Services/#{@solution[:messaging_service_sid]}/Compliance/Usa2p/Usecases"
                        
                    end
                    ##
                    # Fetch the UsAppToPersonUsecaseInstance
                    # @param [String] brand_registration_sid The unique string to identify the A2P brand.
                    # @return [UsAppToPersonUsecaseInstance] Fetched UsAppToPersonUsecaseInstance
                    def fetch(
                        brand_registration_sid: :unset
                    )

                        params = Twilio::Values.of({
                            'BrandRegistrationSid' => brand_registration_sid,
                        })
                        headers = Twilio::Values.of({'Content-Type' => 'application/x-www-form-urlencoded', })
                        
                        payload = @version.fetch('GET', @uri, params: params, headers: headers)
                        UsAppToPersonUsecaseInstance.new(
                            @version,
                            payload,
                            messaging_service_sid: @solution[:messaging_service_sid],
                        )
                    end

                


                    # Provide a user friendly representation
                    def to_s
                        '#<Twilio.Messaging.V1.UsAppToPersonUsecaseList>'
                    end
                end

                class UsAppToPersonUsecasePage < Page
                    ##
                    # Initialize the UsAppToPersonUsecasePage
                    # @param [Version] version Version that contains the resource
                    # @param [Response] response Response from the API
                    # @param [Hash] solution Path solution for the resource
                    # @return [UsAppToPersonUsecasePage] UsAppToPersonUsecasePage
                    def initialize(version, response, solution)
                        super(version, response)

                        # Path Solution
                        @solution = solution
                    end

                    ##
                    # Build an instance of UsAppToPersonUsecaseInstance
                    # @param [Hash] payload Payload response from the API
                    # @return [UsAppToPersonUsecaseInstance] UsAppToPersonUsecaseInstance
                    def get_instance(payload)
                        UsAppToPersonUsecaseInstance.new(@version, payload, messaging_service_sid: @solution[:messaging_service_sid])
                    end

                    ##
                    # Provide a user friendly representation
                    def to_s
                        '<Twilio.Messaging.V1.UsAppToPersonUsecasePage>'
                    end
                end
                class UsAppToPersonUsecaseInstance < InstanceResource
                    ##
                    # Initialize the UsAppToPersonUsecaseInstance
                    # @param [Version] version Version that contains the resource
                    # @param [Hash] payload payload that contains response from Twilio
                    # @param [String] account_sid The SID of the
                    #   {Account}[https://www.twilio.com/docs/iam/api/account] that created this UsAppToPersonUsecase
                    #   resource.
                    # @param [String] sid The SID of the Call resource to fetch.
                    # @return [UsAppToPersonUsecaseInstance] UsAppToPersonUsecaseInstance
                    def initialize(version, payload , messaging_service_sid: nil)
                        super(version)
                        
                        # Marshaled Properties
                        @properties = { 
                            'us_app_to_person_usecases' => payload['us_app_to_person_usecases'],
                        }
                    end

                    
                    ##
                    # @return [Array<Hash>] Human readable name, code, description and post_approval_required (indicates whether or not post approval is required for this Use Case) of A2P Campaign Use Cases.
                    def us_app_to_person_usecases
                        @properties['us_app_to_person_usecases']
                    end
                    
                    ##
                    # Provide a user friendly representation
                    def to_s
                        "<Twilio.Messaging.V1.UsAppToPersonUsecaseInstance>"
                    end

                    ##
                    # Provide a detailed, user friendly representation
                    def inspect
                        "<Twilio.Messaging.V1.UsAppToPersonUsecaseInstance>"
                    end
                end

             end
            end
        end
    end
end


