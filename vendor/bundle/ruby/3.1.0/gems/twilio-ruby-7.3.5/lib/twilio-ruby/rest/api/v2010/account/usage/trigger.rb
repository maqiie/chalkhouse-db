##
#    This code was generated by
#    ___ _ _ _ _ _    _ ____    ____ ____ _    ____ ____ _  _ ____ ____ ____ ___ __   __
#     |  | | | | |    | |  | __ |  | |__| | __ | __ |___ |\ | |___ |__/ |__|  | |  | |__/
#     |  |_|_| | |___ | |__|    |__| |  | |    |__] |___ | \| |___ |  \ |  |  | |__| |  \
#
#    Twilio - Api
#    This is the public Twilio REST API.
#
#    NOTE: This class is auto generated by OpenAPI Generator.
#    https://openapi-generator.tech
#    Do not edit the class manually.
#


module Twilio
    module REST
        class Api < ApiBase
            class V2010 < Version
                class AccountContext < InstanceContext
                class UsageList < ListResource

                     class TriggerList < ListResource
                
                    ##
                    # Initialize the TriggerList
                    # @param [Version] version Version that contains the resource
                    # @return [TriggerList] TriggerList
                    def initialize(version, account_sid: nil)
                        super(version)
                        # Path Solution
                        @solution = { account_sid: account_sid }
                        @uri = "/Accounts/#{@solution[:account_sid]}/Usage/Triggers.json"
                        
                    end
                    ##
                    # Create the TriggerInstance
                    # @param [String] callback_url The URL we should call using `callback_method` when the trigger fires.
                    # @param [String] trigger_value The usage value at which the trigger should fire.  For convenience, you can use an offset value such as `+30` to specify a trigger_value that is 30 units more than the current usage value. Be sure to urlencode a `+` as `%2B`.
                    # @param [UsageCategory] usage_category 
                    # @param [String] callback_method The HTTP method we should use to call `callback_url`. Can be: `GET` or `POST` and the default is `POST`.
                    # @param [String] friendly_name A descriptive string that you create to describe the resource. It can be up to 64 characters long.
                    # @param [Recurring] recurring 
                    # @param [TriggerField] trigger_by 
                    # @return [TriggerInstance] Created TriggerInstance
                    def create(
                        callback_url: nil, 
                        trigger_value: nil, 
                        usage_category: nil, 
                        callback_method: :unset, 
                        friendly_name: :unset, 
                        recurring: :unset, 
                        trigger_by: :unset
                    )

                        data = Twilio::Values.of({
                            'CallbackUrl' => callback_url,
                            'TriggerValue' => trigger_value,
                            'UsageCategory' => usage_category,
                            'CallbackMethod' => callback_method,
                            'FriendlyName' => friendly_name,
                            'Recurring' => recurring,
                            'TriggerBy' => trigger_by,
                        })

                        headers = Twilio::Values.of({'Content-Type' => 'application/x-www-form-urlencoded', })
                        
                        payload = @version.create('POST', @uri, data: data, headers: headers)
                        TriggerInstance.new(
                            @version,
                            payload,
                            account_sid: @solution[:account_sid],
                        )
                    end

                
                    ##
                    # Lists TriggerInstance records from the API as a list.
                    # Unlike stream(), this operation is eager and will load `limit` records into
                    # memory before returning.
                    # @param [Recurring] recurring The frequency of recurring UsageTriggers to read. Can be: `daily`, `monthly`, or `yearly` to read recurring UsageTriggers. An empty value or a value of `alltime` reads non-recurring UsageTriggers.
                    # @param [TriggerField] trigger_by The trigger field of the UsageTriggers to read.  Can be: `count`, `usage`, or `price` as described in the [UsageRecords documentation](https://www.twilio.com/docs/usage/api/usage-record#usage-count-price).
                    # @param [UsageCategory] usage_category The usage category of the UsageTriggers to read. Must be a supported [usage categories](https://www.twilio.com/docs/usage/api/usage-record#usage-categories).
                    # @param [Integer] limit Upper limit for the number of records to return. stream()
                    #    guarantees to never return more than limit.  Default is no limit
                    # @param [Integer] page_size Number of records to fetch per request, when
                    #    not set will use the default value of 50 records.  If no page_size is defined
                    #    but a limit is defined, stream() will attempt to read the limit with the most
                    #    efficient page size, i.e. min(limit, 1000)
                    # @return [Array] Array of up to limit results
                    def list(recurring: :unset, trigger_by: :unset, usage_category: :unset, limit: nil, page_size: nil)
                        self.stream(
                            recurring: recurring,
                            trigger_by: trigger_by,
                            usage_category: usage_category,
                            limit: limit,
                            page_size: page_size
                        ).entries
                    end

                    ##
                    # Streams Instance records from the API as an Enumerable.
                    # This operation lazily loads records as efficiently as possible until the limit
                    # is reached.
                    # @param [Recurring] recurring The frequency of recurring UsageTriggers to read. Can be: `daily`, `monthly`, or `yearly` to read recurring UsageTriggers. An empty value or a value of `alltime` reads non-recurring UsageTriggers.
                    # @param [TriggerField] trigger_by The trigger field of the UsageTriggers to read.  Can be: `count`, `usage`, or `price` as described in the [UsageRecords documentation](https://www.twilio.com/docs/usage/api/usage-record#usage-count-price).
                    # @param [UsageCategory] usage_category The usage category of the UsageTriggers to read. Must be a supported [usage categories](https://www.twilio.com/docs/usage/api/usage-record#usage-categories).
                    # @param [Integer] limit Upper limit for the number of records to return. stream()
                    #    guarantees to never return more than limit.  Default is no limit
                    # @param [Integer] page_size Number of records to fetch per request, when
                    #    not set will use the default value of 50 records.  If no page_size is defined
                    #    but a limit is defined, stream() will attempt to read the limit with the most
                    #    efficient page size, i.e. min(limit, 1000)
                    # @return [Enumerable] Enumerable that will yield up to limit results
                    def stream(recurring: :unset, trigger_by: :unset, usage_category: :unset, limit: nil, page_size: nil)
                        limits = @version.read_limits(limit, page_size)

                        page = self.page(
                            recurring: recurring,
                            trigger_by: trigger_by,
                            usage_category: usage_category,
                            page_size: limits[:page_size], )

                        @version.stream(page, limit: limits[:limit], page_limit: limits[:page_limit])
                    end

                    ##
                    # When passed a block, yields TriggerInstance records from the API.
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
                    # Retrieve a single page of TriggerInstance records from the API.
                    # Request is executed immediately.
                    # @param [Recurring] recurring The frequency of recurring UsageTriggers to read. Can be: `daily`, `monthly`, or `yearly` to read recurring UsageTriggers. An empty value or a value of `alltime` reads non-recurring UsageTriggers.
                    # @param [TriggerField] trigger_by The trigger field of the UsageTriggers to read.  Can be: `count`, `usage`, or `price` as described in the [UsageRecords documentation](https://www.twilio.com/docs/usage/api/usage-record#usage-count-price).
                    # @param [UsageCategory] usage_category The usage category of the UsageTriggers to read. Must be a supported [usage categories](https://www.twilio.com/docs/usage/api/usage-record#usage-categories).
                    # @param [String] page_token PageToken provided by the API
                    # @param [Integer] page_number Page Number, this value is simply for client state
                    # @param [Integer] page_size Number of records to return, defaults to 50
                    # @return [Page] Page of TriggerInstance
                    def page(recurring: :unset, trigger_by: :unset, usage_category: :unset, page_token: :unset, page_number: :unset, page_size: :unset)
                        params = Twilio::Values.of({
                            'Recurring' => recurring,
                            'TriggerBy' => trigger_by,
                            'UsageCategory' => usage_category,
                            'PageToken' => page_token,
                            'Page' => page_number,
                            'PageSize' => page_size,
                        })

                        response = @version.page('GET', @uri, params: params)

                        TriggerPage.new(@version, response, @solution)
                    end

                    ##
                    # Retrieve a single page of TriggerInstance records from the API.
                    # Request is executed immediately.
                    # @param [String] target_url API-generated URL for the requested results page
                    # @return [Page] Page of TriggerInstance
                    def get_page(target_url)
                        response = @version.domain.request(
                            'GET',
                            target_url
                        )
                    TriggerPage.new(@version, response, @solution)
                    end
                    


                    # Provide a user friendly representation
                    def to_s
                        '#<Twilio.Api.V2010.TriggerList>'
                    end
                end


                class TriggerContext < InstanceContext
                    ##
                    # Initialize the TriggerContext
                    # @param [Version] version Version that contains the resource
                    # @param [String] account_sid The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that created the UsageTrigger resources to update.
                    # @param [String] sid The Twilio-provided string that uniquely identifies the UsageTrigger resource to update.
                    # @return [TriggerContext] TriggerContext
                    def initialize(version, account_sid, sid)
                        super(version)

                        # Path Solution
                        @solution = { account_sid: account_sid, sid: sid,  }
                        @uri = "/Accounts/#{@solution[:account_sid]}/Usage/Triggers/#{@solution[:sid]}.json"

                        
                    end
                    ##
                    # Delete the TriggerInstance
                    # @return [Boolean] True if delete succeeds, false otherwise
                    def delete

                        headers = Twilio::Values.of({'Content-Type' => 'application/x-www-form-urlencoded', })
                        
                        @version.delete('DELETE', @uri, headers: headers)
                    end

                    ##
                    # Fetch the TriggerInstance
                    # @return [TriggerInstance] Fetched TriggerInstance
                    def fetch

                        headers = Twilio::Values.of({'Content-Type' => 'application/x-www-form-urlencoded', })
                        
                        payload = @version.fetch('GET', @uri, headers: headers)
                        TriggerInstance.new(
                            @version,
                            payload,
                            account_sid: @solution[:account_sid],
                            sid: @solution[:sid],
                        )
                    end

                    ##
                    # Update the TriggerInstance
                    # @param [String] callback_method The HTTP method we should use to call `callback_url`. Can be: `GET` or `POST` and the default is `POST`.
                    # @param [String] callback_url The URL we should call using `callback_method` when the trigger fires.
                    # @param [String] friendly_name A descriptive string that you create to describe the resource. It can be up to 64 characters long.
                    # @return [TriggerInstance] Updated TriggerInstance
                    def update(
                        callback_method: :unset, 
                        callback_url: :unset, 
                        friendly_name: :unset
                    )

                        data = Twilio::Values.of({
                            'CallbackMethod' => callback_method,
                            'CallbackUrl' => callback_url,
                            'FriendlyName' => friendly_name,
                        })

                        headers = Twilio::Values.of({'Content-Type' => 'application/x-www-form-urlencoded', })
                        
                        payload = @version.update('POST', @uri, data: data, headers: headers)
                        TriggerInstance.new(
                            @version,
                            payload,
                            account_sid: @solution[:account_sid],
                            sid: @solution[:sid],
                        )
                    end


                    ##
                    # Provide a user friendly representation
                    def to_s
                        context = @solution.map{|k, v| "#{k}: #{v}"}.join(',')
                        "#<Twilio.Api.V2010.TriggerContext #{context}>"
                    end

                    ##
                    # Provide a detailed, user friendly representation
                    def inspect
                        context = @solution.map{|k, v| "#{k}: #{v}"}.join(',')
                        "#<Twilio.Api.V2010.TriggerContext #{context}>"
                    end
                end

                class TriggerPage < Page
                    ##
                    # Initialize the TriggerPage
                    # @param [Version] version Version that contains the resource
                    # @param [Response] response Response from the API
                    # @param [Hash] solution Path solution for the resource
                    # @return [TriggerPage] TriggerPage
                    def initialize(version, response, solution)
                        super(version, response)

                        # Path Solution
                        @solution = solution
                    end

                    ##
                    # Build an instance of TriggerInstance
                    # @param [Hash] payload Payload response from the API
                    # @return [TriggerInstance] TriggerInstance
                    def get_instance(payload)
                        TriggerInstance.new(@version, payload, account_sid: @solution[:account_sid])
                    end

                    ##
                    # Provide a user friendly representation
                    def to_s
                        '<Twilio.Api.V2010.TriggerPage>'
                    end
                end
                class TriggerInstance < InstanceResource
                    ##
                    # Initialize the TriggerInstance
                    # @param [Version] version Version that contains the resource
                    # @param [Hash] payload payload that contains response from Twilio
                    # @param [String] account_sid The SID of the
                    #   {Account}[https://www.twilio.com/docs/iam/api/account] that created this Trigger
                    #   resource.
                    # @param [String] sid The SID of the Call resource to fetch.
                    # @return [TriggerInstance] TriggerInstance
                    def initialize(version, payload , account_sid: nil, sid: nil)
                        super(version)
                        
                        # Marshaled Properties
                        @properties = { 
                            'account_sid' => payload['account_sid'],
                            'api_version' => payload['api_version'],
                            'callback_method' => payload['callback_method'],
                            'callback_url' => payload['callback_url'],
                            'current_value' => payload['current_value'],
                            'date_created' => Twilio.deserialize_rfc2822(payload['date_created']),
                            'date_fired' => Twilio.deserialize_rfc2822(payload['date_fired']),
                            'date_updated' => Twilio.deserialize_rfc2822(payload['date_updated']),
                            'friendly_name' => payload['friendly_name'],
                            'recurring' => payload['recurring'],
                            'sid' => payload['sid'],
                            'trigger_by' => payload['trigger_by'],
                            'trigger_value' => payload['trigger_value'],
                            'uri' => payload['uri'],
                            'usage_category' => payload['usage_category'],
                            'usage_record_uri' => payload['usage_record_uri'],
                        }

                        # Context
                        @instance_context = nil
                        @params = { 'account_sid' => account_sid  ,'sid' => sid  || @properties['sid']  , }
                    end

                    ##
                    # Generate an instance context for the instance, the context is capable of
                    # performing various actions.  All instance actions are proxied to the context
                    # @return [TriggerContext] CallContext for this CallInstance
                    def context
                        unless @instance_context
                            @instance_context = TriggerContext.new(@version , @params['account_sid'], @params['sid'])
                        end
                        @instance_context
                    end
                    
                    ##
                    # @return [String] The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that the trigger monitors.
                    def account_sid
                        @properties['account_sid']
                    end
                    
                    ##
                    # @return [String] The API version used to create the resource.
                    def api_version
                        @properties['api_version']
                    end
                    
                    ##
                    # @return [String] The HTTP method we use to call `callback_url`. Can be: `GET` or `POST`.
                    def callback_method
                        @properties['callback_method']
                    end
                    
                    ##
                    # @return [String] The URL we call using the `callback_method` when the trigger fires.
                    def callback_url
                        @properties['callback_url']
                    end
                    
                    ##
                    # @return [String] The current value of the field the trigger is watching.
                    def current_value
                        @properties['current_value']
                    end
                    
                    ##
                    # @return [Time] The date and time in GMT that the resource was created specified in [RFC 2822](https://www.ietf.org/rfc/rfc2822.txt) format.
                    def date_created
                        @properties['date_created']
                    end
                    
                    ##
                    # @return [Time] The date and time in GMT that the trigger was last fired specified in [RFC 2822](https://www.ietf.org/rfc/rfc2822.txt) format.
                    def date_fired
                        @properties['date_fired']
                    end
                    
                    ##
                    # @return [Time] The date and time in GMT that the resource was last updated specified in [RFC 2822](https://www.ietf.org/rfc/rfc2822.txt) format.
                    def date_updated
                        @properties['date_updated']
                    end
                    
                    ##
                    # @return [String] The string that you assigned to describe the trigger.
                    def friendly_name
                        @properties['friendly_name']
                    end
                    
                    ##
                    # @return [Recurring] 
                    def recurring
                        @properties['recurring']
                    end
                    
                    ##
                    # @return [String] The unique string that that we created to identify the UsageTrigger resource.
                    def sid
                        @properties['sid']
                    end
                    
                    ##
                    # @return [TriggerField] 
                    def trigger_by
                        @properties['trigger_by']
                    end
                    
                    ##
                    # @return [String] The value at which the trigger will fire.  Must be a positive, numeric value.
                    def trigger_value
                        @properties['trigger_value']
                    end
                    
                    ##
                    # @return [String] The URI of the resource, relative to `https://api.twilio.com`.
                    def uri
                        @properties['uri']
                    end
                    
                    ##
                    # @return [UsageCategory] 
                    def usage_category
                        @properties['usage_category']
                    end
                    
                    ##
                    # @return [String] The URI of the [UsageRecord](https://www.twilio.com/docs/usage/api/usage-record) resource this trigger watches, relative to `https://api.twilio.com`.
                    def usage_record_uri
                        @properties['usage_record_uri']
                    end
                    
                    ##
                    # Delete the TriggerInstance
                    # @return [Boolean] True if delete succeeds, false otherwise
                    def delete

                        context.delete
                    end

                    ##
                    # Fetch the TriggerInstance
                    # @return [TriggerInstance] Fetched TriggerInstance
                    def fetch

                        context.fetch
                    end

                    ##
                    # Update the TriggerInstance
                    # @param [String] callback_method The HTTP method we should use to call `callback_url`. Can be: `GET` or `POST` and the default is `POST`.
                    # @param [String] callback_url The URL we should call using `callback_method` when the trigger fires.
                    # @param [String] friendly_name A descriptive string that you create to describe the resource. It can be up to 64 characters long.
                    # @return [TriggerInstance] Updated TriggerInstance
                    def update(
                        callback_method: :unset, 
                        callback_url: :unset, 
                        friendly_name: :unset
                    )

                        context.update(
                            callback_method: callback_method, 
                            callback_url: callback_url, 
                            friendly_name: friendly_name, 
                        )
                    end

                    ##
                    # Provide a user friendly representation
                    def to_s
                        values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
                        "<Twilio.Api.V2010.TriggerInstance #{values}>"
                    end

                    ##
                    # Provide a detailed, user friendly representation
                    def inspect
                        values = @properties.map{|k, v| "#{k}: #{v}"}.join(" ")
                        "<Twilio.Api.V2010.TriggerInstance #{values}>"
                    end
                end

             end
             end
            end
        end
    end
end


