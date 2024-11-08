##
#    This code was generated by
#    ___ _ _ _ _ _    _ ____    ____ ____ _    ____ ____ _  _ ____ ____ ____ ___ __   __
#     |  | | | | |    | |  | __ |  | |__| | __ | __ |___ |\ | |___ |__/ |__|  | |  | |__/
#     |  |_|_| | |___ | |__|    |__| |  | |    |__] |___ | \| |___ |  \ |  |  | |__| |  \
#
#    Twilio - Trusthub
#    This is the public Twilio REST API.
#
#    NOTE: This class is auto generated by OpenAPI Generator.
#    https://openapi-generator.tech
#    Do not edit the class manually.
#


module Twilio
    module REST
        class Trusthub < TrusthubBase
            class V1 < Version
                class ComplianceInquiriesList < ListResource
                
                    ##
                    # Initialize the ComplianceInquiriesList
                    # @param [Version] version Version that contains the resource
                    # @return [ComplianceInquiriesList] ComplianceInquiriesList
                    def initialize(version)
                        super(version)
                        # Path Solution
                        @solution = {  }
                        @uri = "/ComplianceInquiries/Customers/Initialize"
                        
                    end
                    ##
                    # Create the ComplianceInquiriesInstance
                    # @param [String] primary_profile_sid The unique SID identifier of the Primary Customer Profile that should be used as a parent. Only necessary when creating a secondary Customer Profile.
                    # @param [String] notification_email The email address that approval status updates will be sent to. If not specified, the email address associated with your primary customer profile will be used.
                    # @param [String] theme_set_id Theme id for styling the inquiry form.
                    # @return [ComplianceInquiriesInstance] Created ComplianceInquiriesInstance
                    def create(
                        primary_profile_sid: nil, 
                        notification_email: :unset, 
                        theme_set_id: :unset
                    )

                        data = Twilio::Values.of({
                            'PrimaryProfileSid' => primary_profile_sid,
                            'NotificationEmail' => notification_email,
                            'ThemeSetId' => theme_set_id,
                        })

                        headers = Twilio::Values.of({'Content-Type' => 'application/x-www-form-urlencoded', })
                        
                        payload = @version.create('POST', @uri, data: data, headers: headers)
                        ComplianceInquiriesInstance.new(
                            @version,
                            payload,
                        )
                    end

                


                    # Provide a user friendly representation
                    def to_s
                        '#<Twilio.Trusthub.V1.ComplianceInquiriesList>'
                    end
                end


                class ComplianceInquiriesContext < InstanceContext
                    ##
                    # Initialize the ComplianceInquiriesContext
                    # @param [Version] version Version that contains the resource
                    # @param [String] customer_id The unique CustomerId matching the Customer Profile/Compliance Inquiry that should be resumed or resubmitted. This value will have been returned by the initial Compliance Inquiry creation call.
                    # @return [ComplianceInquiriesContext] ComplianceInquiriesContext
                    def initialize(version, customer_id)
                        super(version)

                        # Path Solution
                        @solution = { customer_id: customer_id,  }
                        @uri = "/ComplianceInquiries/Customers/#{@solution[:customer_id]}/Initialize"

                        
                    end
                    ##
                    # Update the ComplianceInquiriesInstance
                    # @param [String] primary_profile_sid The unique SID identifier of the Primary Customer Profile that should be used as a parent. Only necessary when creating a secondary Customer Profile.
                    # @param [String] theme_set_id Theme id for styling the inquiry form.
                    # @return [ComplianceInquiriesInstance] Updated ComplianceInquiriesInstance
                    def update(
                        primary_profile_sid: nil, 
                        theme_set_id: :unset
                    )

                        data = Twilio::Values.of({
                            'PrimaryProfileSid' => primary_profile_sid,
                            'ThemeSetId' => theme_set_id,
                        })

                        headers = Twilio::Values.of({'Content-Type' => 'application/x-www-form-urlencoded', })
                        
                        payload = @version.update('POST', @uri, data: data, headers: headers)
                        ComplianceInquiriesInstance.new(
                            @version,
                            payload,
                            customer_id: @solution[:customer_id],
                        )
                    end


                    ##
                    # Provide a user friendly representation
                    def to_s
                        context = @solution.map{|k, v| "#{k}: #{v}"}.join(',')
                        "#<Twilio.Trusthub.V1.ComplianceInquiriesContext #{context}>"
                    end

                    ##
                    # Provide a detailed, user friendly representation
                    def inspect
                        context = @solution.map{|k, v| "#{k}: #{v}"}.join(',')
                        "#<Twilio.Trusthub.V1.ComplianceInquiriesContext #{context}>"
                    end
                end

                class ComplianceInquiriesPage < Page
                    ##
                    # Initialize the ComplianceInquiriesPage
                    # @param [Version] version Version that contains the resource
                    # @param [Response] response Response from the API
                    # @param [Hash] solution Path solution for the resource
                    # @return [ComplianceInquiriesPage] ComplianceInquiriesPage
                    def initialize(version, response, solution)
                        super(version, response)

                        # Path Solution
                        @solution = solution
                    end

                    ##
                    # Build an instance of ComplianceInquiriesInstance
                    # @param [Hash] payload Payload response from the API
                    # @return [ComplianceInquiriesInstance] ComplianceInquiriesInstance
                    def get_instance(payload)
                        ComplianceInquiriesInstance.new(@version, payload)
                    end

                    ##
                    # Provide a user friendly representation
                    def to_s
                        '<Twilio.Trusthub.V1.ComplianceInquiriesPage>'
                    end
                end
                class ComplianceInquiriesInstance < InstanceResource
                    ##
                    # Initialize the ComplianceInquiriesInstance
                    # @param [Version] version Version that contains the resource
                    # @param [Hash] payload payload that contains response from Twilio
                    # @param [String] account_sid The SID of the
                    #   {Account}[https://www.twilio.com/docs/iam/api/account] that created this ComplianceInquiries
                    #   resource.
                    # @param [String] sid The SID of the Call resource to fetch.
                    # @return [ComplianceInquiriesInstance] ComplianceInquiriesInstance
                    def initialize(version, payload , customer_id: nil)
                        super(version)
                        
                        # Marshaled Properties
                        @properties = { 
                            'inquiry_id' => payload['inquiry_id'],
                            'inquiry_session_token' => payload['inquiry_session_token'],
                            'customer_id' => payload['customer_id'],
                            'url' => payload['url'],
                        }

                        # Context
                        @instance_context = nil
                        @params = { 'customer_id' => customer_id  || @properties['customer_id']  , }
                    end

                    ##
                    # Generate an instance context for the instance, the context is capable of
                    # performing various actions.  All instance actions are proxied to the context
                    # @return [ComplianceInquiriesContext] CallContext for this CallInstance
                    def context
                        unless @instance_context
                            @instance_context = ComplianceInquiriesContext.new(@version , @params['customer_id'])
                        end
                        @instance_context
                    end
                    
                    ##
                    # @return [String] The unique ID used to start an embedded compliance registration session.
                    def inquiry_id
                        @properties['inquiry_id']
                    end
                    
                    ##
                    # @return [String] The session token used to start an embedded compliance registration session.
                    def inquiry_session_token
                        @properties['inquiry_session_token']
                    end
                    
                    ##
                    # @return [String] The CustomerID matching the Customer Profile that should be resumed or resubmitted for editing.
                    def customer_id
                        @properties['customer_id']
                    end
                    
                    ##
                    # @return [String] The URL of this resource.
                    def url
                        @properties['url']
                    end
                    
                    ##
                    # Update the ComplianceInquiriesInstance
                    # @param [String] primary_profile_sid The unique SID identifier of the Primary Customer Profile that should be used as a parent. Only necessary when creating a secondary Customer Profile.
                    # @param [String] theme_set_id Theme id for styling the inquiry form.
                    # @return [ComplianceInquiriesInstance] Updated ComplianceInquiriesInstance
                    def update(
                        primary_profile_sid: nil, 
                        theme_set_id: :unset
                    )

                        context.update(
                            primary_profile_sid: primary_profile_sid, 
                            theme_set_id: theme_set_id, 
                        )
                    end

                    ##
                    # Provide a user friendly representation
                    def to_s
                        values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
                        "<Twilio.Trusthub.V1.ComplianceInquiriesInstance #{values}>"
                    end

                    ##
                    # Provide a detailed, user friendly representation
                    def inspect
                        values = @properties.map{|k, v| "#{k}: #{v}"}.join(" ")
                        "<Twilio.Trusthub.V1.ComplianceInquiriesInstance #{values}>"
                    end
                end

            end
        end
    end
end
