##
#    This code was generated by
#    ___ _ _ _ _ _    _ ____    ____ ____ _    ____ ____ _  _ ____ ____ ____ ___ __   __
#     |  | | | | |    | |  | __ |  | |__| | __ | __ |___ |\ | |___ |__/ |__|  | |  | |__/
#     |  |_|_| | |___ | |__|    |__| |  | |    |__] |___ | \| |___ |  \ |  |  | |__| |  \
#
#    Twilio - Assistants
#    This is the public Twilio REST API.
#
#    NOTE: This class is auto generated by OpenAPI Generator.
#    https://openapi-generator.tech
#    Do not edit the class manually.
#


module Twilio
    module REST
        class Assistants < AssistantsBase
            class V1 < Version
                class AssistantContext < InstanceContext

                     class AssistantsToolList < ListResource
                
                    ##
                    # Initialize the AssistantsToolList
                    # @param [Version] version Version that contains the resource
                    # @return [AssistantsToolList] AssistantsToolList
                    def initialize(version, assistant_id: nil)
                        super(version)
                        # Path Solution
                        @solution = { assistant_id: assistant_id }
                        @uri = "/Assistants/#{@solution[:assistant_id]}/Tools"
                        
                    end
                
                    ##
                    # Lists AssistantsToolInstance records from the API as a list.
                    # Unlike stream(), this operation is eager and will load `limit` records into
                    # memory before returning.
                    # @param [Integer] limit Upper limit for the number of records to return. stream()
                    #    guarantees to never return more than limit.  Default is no limit
                    # @param [Integer] page_size Number of records to fetch per request, when
                    #    not set will use the default value of 50 records.  If no page_size is defined
                    #    but a limit is defined, stream() will attempt to read the limit with the most
                    #    efficient page size, i.e. min(limit, 1000)
                    # @return [Array] Array of up to limit results
                    def list(limit: nil, page_size: nil)
                        self.stream(
                            limit: limit,
                            page_size: page_size
                        ).entries
                    end

                    ##
                    # Streams Instance records from the API as an Enumerable.
                    # This operation lazily loads records as efficiently as possible until the limit
                    # is reached.
                    # @param [Integer] limit Upper limit for the number of records to return. stream()
                    #    guarantees to never return more than limit.  Default is no limit
                    # @param [Integer] page_size Number of records to fetch per request, when
                    #    not set will use the default value of 50 records.  If no page_size is defined
                    #    but a limit is defined, stream() will attempt to read the limit with the most
                    #    efficient page size, i.e. min(limit, 1000)
                    # @return [Enumerable] Enumerable that will yield up to limit results
                    def stream(limit: nil, page_size: nil)
                        limits = @version.read_limits(limit, page_size)

                        page = self.page(
                            page_size: limits[:page_size], )

                        @version.stream(page, limit: limits[:limit], page_limit: limits[:page_limit])
                    end

                    ##
                    # When passed a block, yields AssistantsToolInstance records from the API.
                    # This operation lazily loads records as efficiently as possible until the limit
                    # is reached.
                    def each
                        limits = @version.read_limits

                        page = self.page(page_size: limits[:page_size], )

                        @version.stream(page,
                            limit: limits[:limit],
                            page_limit: limits[:page_limit]).each {|x| yield x}
                    end

                    ##
                    # Retrieve a single page of AssistantsToolInstance records from the API.
                    # Request is executed immediately.
                    # @param [String] page_token PageToken provided by the API
                    # @param [Integer] page_number Page Number, this value is simply for client state
                    # @param [Integer] page_size Number of records to return, defaults to 50
                    # @return [Page] Page of AssistantsToolInstance
                    def page(page_token: :unset, page_number: :unset, page_size: :unset)
                        params = Twilio::Values.of({
                            'PageToken' => page_token,
                            'Page' => page_number,
                            'PageSize' => page_size,
                        })

                        response = @version.page('GET', @uri, params: params)

                        AssistantsToolPage.new(@version, response, @solution)
                    end

                    ##
                    # Retrieve a single page of AssistantsToolInstance records from the API.
                    # Request is executed immediately.
                    # @param [String] target_url API-generated URL for the requested results page
                    # @return [Page] Page of AssistantsToolInstance
                    def get_page(target_url)
                        response = @version.domain.request(
                            'GET',
                            target_url
                        )
                    AssistantsToolPage.new(@version, response, @solution)
                    end
                    


                    # Provide a user friendly representation
                    def to_s
                        '#<Twilio.Assistants.V1.AssistantsToolList>'
                    end
                end


                class AssistantsToolContext < InstanceContext
                    ##
                    # Initialize the AssistantsToolContext
                    # @param [Version] version Version that contains the resource
                    # @param [String] assistant_id The assistant ID.
                    # @param [String] id The tool ID.
                    # @return [AssistantsToolContext] AssistantsToolContext
                    def initialize(version, assistant_id, id)
                        super(version)

                        # Path Solution
                        @solution = { assistant_id: assistant_id, id: id,  }
                        @uri = "/Assistants/#{@solution[:assistant_id]}/Tools/#{@solution[:id]}"

                        
                    end
                    ##
                    # Create the AssistantsToolInstance
                    # @return [AssistantsToolInstance] Created AssistantsToolInstance
                    def create

                        headers = Twilio::Values.of({'Content-Type' => 'application/x-www-form-urlencoded', })
                        
                        payload = @version.create('POST', @uri, headers: headers)
                        AssistantsToolInstance.new(
                            @version,
                            payload,
                            assistant_id: @solution[:assistant_id],
                            id: @solution[:id],
                        )
                    end

                    ##
                    # Delete the AssistantsToolInstance
                    # @return [Boolean] True if delete succeeds, false otherwise
                    def delete

                        headers = Twilio::Values.of({'Content-Type' => 'application/x-www-form-urlencoded', })
                        
                        @version.delete('DELETE', @uri, headers: headers)
                    end


                    ##
                    # Provide a user friendly representation
                    def to_s
                        context = @solution.map{|k, v| "#{k}: #{v}"}.join(',')
                        "#<Twilio.Assistants.V1.AssistantsToolContext #{context}>"
                    end

                    ##
                    # Provide a detailed, user friendly representation
                    def inspect
                        context = @solution.map{|k, v| "#{k}: #{v}"}.join(',')
                        "#<Twilio.Assistants.V1.AssistantsToolContext #{context}>"
                    end
                end

                class AssistantsToolPage < Page
                    ##
                    # Initialize the AssistantsToolPage
                    # @param [Version] version Version that contains the resource
                    # @param [Response] response Response from the API
                    # @param [Hash] solution Path solution for the resource
                    # @return [AssistantsToolPage] AssistantsToolPage
                    def initialize(version, response, solution)
                        super(version, response)

                        # Path Solution
                        @solution = solution
                    end

                    ##
                    # Build an instance of AssistantsToolInstance
                    # @param [Hash] payload Payload response from the API
                    # @return [AssistantsToolInstance] AssistantsToolInstance
                    def get_instance(payload)
                        AssistantsToolInstance.new(@version, payload, assistant_id: @solution[:assistant_id])
                    end

                    ##
                    # Provide a user friendly representation
                    def to_s
                        '<Twilio.Assistants.V1.AssistantsToolPage>'
                    end
                end
                class AssistantsToolInstance < InstanceResource
                    ##
                    # Initialize the AssistantsToolInstance
                    # @param [Version] version Version that contains the resource
                    # @param [Hash] payload payload that contains response from Twilio
                    # @param [String] account_sid The SID of the
                    #   {Account}[https://www.twilio.com/docs/iam/api/account] that created this AssistantsTool
                    #   resource.
                    # @param [String] sid The SID of the Call resource to fetch.
                    # @return [AssistantsToolInstance] AssistantsToolInstance
                    def initialize(version, payload , assistant_id: nil, id: nil)
                        super(version)
                        
                        # Marshaled Properties
                        @properties = { 
                            'account_sid' => payload['account_sid'],
                            'description' => payload['description'],
                            'enabled' => payload['enabled'],
                            'id' => payload['id'],
                            'meta' => payload['meta'],
                            'name' => payload['name'],
                            'requires_auth' => payload['requires_auth'],
                            'type' => payload['type'],
                            'url' => payload['url'],
                            'date_created' => Twilio.deserialize_iso8601_datetime(payload['date_created']),
                            'date_updated' => Twilio.deserialize_iso8601_datetime(payload['date_updated']),
                        }

                        # Context
                        @instance_context = nil
                        @params = { 'assistant_id' => assistant_id  || @properties['assistant_id']  ,'id' => id  || @properties['id']  , }
                    end

                    ##
                    # Generate an instance context for the instance, the context is capable of
                    # performing various actions.  All instance actions are proxied to the context
                    # @return [AssistantsToolContext] CallContext for this CallInstance
                    def context
                        unless @instance_context
                            @instance_context = AssistantsToolContext.new(@version , @params['assistant_id'], @params['id'])
                        end
                        @instance_context
                    end
                    
                    ##
                    # @return [String] The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that created the Tool resource.
                    def account_sid
                        @properties['account_sid']
                    end
                    
                    ##
                    # @return [String] The description of the tool.
                    def description
                        @properties['description']
                    end
                    
                    ##
                    # @return [Boolean] True if the tool is enabled.
                    def enabled
                        @properties['enabled']
                    end
                    
                    ##
                    # @return [String] The tool ID.
                    def id
                        @properties['id']
                    end
                    
                    ##
                    # @return [Hash] The metadata related to method, url, input_schema to used with the Tool.
                    def meta
                        @properties['meta']
                    end
                    
                    ##
                    # @return [String] The name of the tool.
                    def name
                        @properties['name']
                    end
                    
                    ##
                    # @return [Boolean] The authentication requirement for the tool.
                    def requires_auth
                        @properties['requires_auth']
                    end
                    
                    ##
                    # @return [String] The type of the tool. ('WEBHOOK')
                    def type
                        @properties['type']
                    end
                    
                    ##
                    # @return [String] The url of the tool resource.
                    def url
                        @properties['url']
                    end
                    
                    ##
                    # @return [Time] The date and time in GMT when the Tool was created specified in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.
                    def date_created
                        @properties['date_created']
                    end
                    
                    ##
                    # @return [Time] The date and time in GMT when the Tool was last updated specified in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.
                    def date_updated
                        @properties['date_updated']
                    end
                    
                    ##
                    # Create the AssistantsToolInstance
                    # @return [AssistantsToolInstance] Created AssistantsToolInstance
                    def create

                        context.create
                    end

                    ##
                    # Delete the AssistantsToolInstance
                    # @return [Boolean] True if delete succeeds, false otherwise
                    def delete

                        context.delete
                    end

                    ##
                    # Provide a user friendly representation
                    def to_s
                        values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
                        "<Twilio.Assistants.V1.AssistantsToolInstance #{values}>"
                    end

                    ##
                    # Provide a detailed, user friendly representation
                    def inspect
                        values = @properties.map{|k, v| "#{k}: #{v}"}.join(" ")
                        "<Twilio.Assistants.V1.AssistantsToolInstance #{values}>"
                    end
                end

             end
            end
        end
    end
end


