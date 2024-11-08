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

                     class RecordList < ListResource
                
                    ##
                    # Initialize the RecordList
                    # @param [Version] version Version that contains the resource
                    # @return [RecordList] RecordList
                    def initialize(version, account_sid: nil)
                        super(version)
                        # Path Solution
                        @solution = { account_sid: account_sid }
                        @uri = "/Accounts/#{@solution[:account_sid]}/Usage/Records.json"
                        # Components
                        @last_month = nil
                        @today = nil
                        @yearly = nil
                        @this_month = nil
                        @daily = nil
                        @all_time = nil
                        @yesterday = nil
                        @monthly = nil
                    end
                
                    ##
                    # Lists RecordInstance records from the API as a list.
                    # Unlike stream(), this operation is eager and will load `limit` records into
                    # memory before returning.
                    # @param [Category] category The [usage category](https://www.twilio.com/docs/usage/api/usage-record#usage-categories) of the UsageRecord resources to read. Only UsageRecord resources in the specified category are retrieved.
                    # @param [Date] start_date Only include usage that has occurred on or after this date. Specify the date in GMT and format as `YYYY-MM-DD`. You can also specify offsets from the current date, such as: `-30days`, which will set the start date to be 30 days before the current date.
                    # @param [Date] end_date Only include usage that occurred on or before this date. Specify the date in GMT and format as `YYYY-MM-DD`.  You can also specify offsets from the current date, such as: `+30days`, which will set the end date to 30 days from the current date.
                    # @param [Boolean] include_subaccounts Whether to include usage from the master account and all its subaccounts. Can be: `true` (the default) to include usage from the master account and all subaccounts or `false` to retrieve usage from only the specified account.
                    # @param [Integer] limit Upper limit for the number of records to return. stream()
                    #    guarantees to never return more than limit.  Default is no limit
                    # @param [Integer] page_size Number of records to fetch per request, when
                    #    not set will use the default value of 50 records.  If no page_size is defined
                    #    but a limit is defined, stream() will attempt to read the limit with the most
                    #    efficient page size, i.e. min(limit, 1000)
                    # @return [Array] Array of up to limit results
                    def list(category: :unset, start_date: :unset, end_date: :unset, include_subaccounts: :unset, limit: nil, page_size: nil)
                        self.stream(
                            category: category,
                            start_date: start_date,
                            end_date: end_date,
                            include_subaccounts: include_subaccounts,
                            limit: limit,
                            page_size: page_size
                        ).entries
                    end

                    ##
                    # Streams Instance records from the API as an Enumerable.
                    # This operation lazily loads records as efficiently as possible until the limit
                    # is reached.
                    # @param [Category] category The [usage category](https://www.twilio.com/docs/usage/api/usage-record#usage-categories) of the UsageRecord resources to read. Only UsageRecord resources in the specified category are retrieved.
                    # @param [Date] start_date Only include usage that has occurred on or after this date. Specify the date in GMT and format as `YYYY-MM-DD`. You can also specify offsets from the current date, such as: `-30days`, which will set the start date to be 30 days before the current date.
                    # @param [Date] end_date Only include usage that occurred on or before this date. Specify the date in GMT and format as `YYYY-MM-DD`.  You can also specify offsets from the current date, such as: `+30days`, which will set the end date to 30 days from the current date.
                    # @param [Boolean] include_subaccounts Whether to include usage from the master account and all its subaccounts. Can be: `true` (the default) to include usage from the master account and all subaccounts or `false` to retrieve usage from only the specified account.
                    # @param [Integer] limit Upper limit for the number of records to return. stream()
                    #    guarantees to never return more than limit.  Default is no limit
                    # @param [Integer] page_size Number of records to fetch per request, when
                    #    not set will use the default value of 50 records.  If no page_size is defined
                    #    but a limit is defined, stream() will attempt to read the limit with the most
                    #    efficient page size, i.e. min(limit, 1000)
                    # @return [Enumerable] Enumerable that will yield up to limit results
                    def stream(category: :unset, start_date: :unset, end_date: :unset, include_subaccounts: :unset, limit: nil, page_size: nil)
                        limits = @version.read_limits(limit, page_size)

                        page = self.page(
                            category: category,
                            start_date: start_date,
                            end_date: end_date,
                            include_subaccounts: include_subaccounts,
                            page_size: limits[:page_size], )

                        @version.stream(page, limit: limits[:limit], page_limit: limits[:page_limit])
                    end

                    ##
                    # When passed a block, yields RecordInstance records from the API.
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
                    # Retrieve a single page of RecordInstance records from the API.
                    # Request is executed immediately.
                    # @param [Category] category The [usage category](https://www.twilio.com/docs/usage/api/usage-record#usage-categories) of the UsageRecord resources to read. Only UsageRecord resources in the specified category are retrieved.
                    # @param [Date] start_date Only include usage that has occurred on or after this date. Specify the date in GMT and format as `YYYY-MM-DD`. You can also specify offsets from the current date, such as: `-30days`, which will set the start date to be 30 days before the current date.
                    # @param [Date] end_date Only include usage that occurred on or before this date. Specify the date in GMT and format as `YYYY-MM-DD`.  You can also specify offsets from the current date, such as: `+30days`, which will set the end date to 30 days from the current date.
                    # @param [Boolean] include_subaccounts Whether to include usage from the master account and all its subaccounts. Can be: `true` (the default) to include usage from the master account and all subaccounts or `false` to retrieve usage from only the specified account.
                    # @param [String] page_token PageToken provided by the API
                    # @param [Integer] page_number Page Number, this value is simply for client state
                    # @param [Integer] page_size Number of records to return, defaults to 50
                    # @return [Page] Page of RecordInstance
                    def page(category: :unset, start_date: :unset, end_date: :unset, include_subaccounts: :unset, page_token: :unset, page_number: :unset, page_size: :unset)
                        params = Twilio::Values.of({
                            'Category' => category,
                            'StartDate' =>  Twilio.serialize_iso8601_date(start_date),
                            'EndDate' =>  Twilio.serialize_iso8601_date(end_date),
                            'IncludeSubaccounts' => include_subaccounts,
                            'PageToken' => page_token,
                            'Page' => page_number,
                            'PageSize' => page_size,
                        })

                        response = @version.page('GET', @uri, params: params)

                        RecordPage.new(@version, response, @solution)
                    end

                    ##
                    # Retrieve a single page of RecordInstance records from the API.
                    # Request is executed immediately.
                    # @param [String] target_url API-generated URL for the requested results page
                    # @return [Page] Page of RecordInstance
                    def get_page(target_url)
                        response = @version.domain.request(
                            'GET',
                            target_url
                        )
                    RecordPage.new(@version, response, @solution)
                    end
                    

                ##
                # Access the last_month
                # @return [LastMonthList]
                # @return [LastMonthContext]
                def last_month
                    @last_month ||= LastMonthList.new(@version, account_sid: @solution[:account_sid] )
                end
                ##
                # Access the today
                # @return [TodayList]
                # @return [TodayContext]
                def today
                    @today ||= TodayList.new(@version, account_sid: @solution[:account_sid] )
                end
                ##
                # Access the yearly
                # @return [YearlyList]
                # @return [YearlyContext]
                def yearly
                    @yearly ||= YearlyList.new(@version, account_sid: @solution[:account_sid] )
                end
                ##
                # Access the this_month
                # @return [ThisMonthList]
                # @return [ThisMonthContext]
                def this_month
                    @this_month ||= ThisMonthList.new(@version, account_sid: @solution[:account_sid] )
                end
                ##
                # Access the daily
                # @return [DailyList]
                # @return [DailyContext]
                def daily
                    @daily ||= DailyList.new(@version, account_sid: @solution[:account_sid] )
                end
                ##
                # Access the all_time
                # @return [AllTimeList]
                # @return [AllTimeContext]
                def all_time
                    @all_time ||= AllTimeList.new(@version, account_sid: @solution[:account_sid] )
                end
                ##
                # Access the yesterday
                # @return [YesterdayList]
                # @return [YesterdayContext]
                def yesterday
                    @yesterday ||= YesterdayList.new(@version, account_sid: @solution[:account_sid] )
                end
                ##
                # Access the monthly
                # @return [MonthlyList]
                # @return [MonthlyContext]
                def monthly
                    @monthly ||= MonthlyList.new(@version, account_sid: @solution[:account_sid] )
                end

                    # Provide a user friendly representation
                    def to_s
                        '#<Twilio.Api.V2010.RecordList>'
                    end
                end

                class RecordPage < Page
                    ##
                    # Initialize the RecordPage
                    # @param [Version] version Version that contains the resource
                    # @param [Response] response Response from the API
                    # @param [Hash] solution Path solution for the resource
                    # @return [RecordPage] RecordPage
                    def initialize(version, response, solution)
                        super(version, response)

                        # Path Solution
                        @solution = solution
                    end

                    ##
                    # Build an instance of RecordInstance
                    # @param [Hash] payload Payload response from the API
                    # @return [RecordInstance] RecordInstance
                    def get_instance(payload)
                        RecordInstance.new(@version, payload, account_sid: @solution[:account_sid])
                    end

                    ##
                    # Provide a user friendly representation
                    def to_s
                        '<Twilio.Api.V2010.RecordPage>'
                    end
                end
                class RecordInstance < InstanceResource
                    ##
                    # Initialize the RecordInstance
                    # @param [Version] version Version that contains the resource
                    # @param [Hash] payload payload that contains response from Twilio
                    # @param [String] account_sid The SID of the
                    #   {Account}[https://www.twilio.com/docs/iam/api/account] that created this Record
                    #   resource.
                    # @param [String] sid The SID of the Call resource to fetch.
                    # @return [RecordInstance] RecordInstance
                    def initialize(version, payload , account_sid: nil)
                        super(version)
                        
                        # Marshaled Properties
                        @properties = { 
                            'account_sid' => payload['account_sid'],
                            'api_version' => payload['api_version'],
                            'as_of' => payload['as_of'],
                            'category' => payload['category'],
                            'count' => payload['count'],
                            'count_unit' => payload['count_unit'],
                            'description' => payload['description'],
                            'end_date' => Twilio.deserialize_iso8601_date(payload['end_date']),
                            'price' => payload['price'],
                            'price_unit' => payload['price_unit'],
                            'start_date' => Twilio.deserialize_iso8601_date(payload['start_date']),
                            'subresource_uris' => payload['subresource_uris'],
                            'uri' => payload['uri'],
                            'usage' => payload['usage'],
                            'usage_unit' => payload['usage_unit'],
                        }
                    end

                    
                    ##
                    # @return [String] The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that accrued the usage.
                    def account_sid
                        @properties['account_sid']
                    end
                    
                    ##
                    # @return [String] The API version used to create the resource.
                    def api_version
                        @properties['api_version']
                    end
                    
                    ##
                    # @return [String] Usage records up to date as of this timestamp, formatted as YYYY-MM-DDTHH:MM:SS+00:00. All timestamps are in GMT
                    def as_of
                        @properties['as_of']
                    end
                    
                    ##
                    # @return [Category] 
                    def category
                        @properties['category']
                    end
                    
                    ##
                    # @return [String] The number of usage events, such as the number of calls.
                    def count
                        @properties['count']
                    end
                    
                    ##
                    # @return [String] The units in which `count` is measured, such as `calls` for calls or `messages` for SMS.
                    def count_unit
                        @properties['count_unit']
                    end
                    
                    ##
                    # @return [String] A plain-language description of the usage category.
                    def description
                        @properties['description']
                    end
                    
                    ##
                    # @return [Date] The last date for which usage is included in the UsageRecord. The date is specified in GMT and formatted as `YYYY-MM-DD`.
                    def end_date
                        @properties['end_date']
                    end
                    
                    ##
                    # @return [Float] The total price of the usage in the currency specified in `price_unit` and associated with the account.
                    def price
                        @properties['price']
                    end
                    
                    ##
                    # @return [String] The currency in which `price` is measured, in [ISO 4127](https://www.iso.org/iso/home/standards/currency_codes.htm) format, such as `usd`, `eur`, and `jpy`.
                    def price_unit
                        @properties['price_unit']
                    end
                    
                    ##
                    # @return [Date] The first date for which usage is included in this UsageRecord. The date is specified in GMT and formatted as `YYYY-MM-DD`.
                    def start_date
                        @properties['start_date']
                    end
                    
                    ##
                    # @return [Hash] A list of related resources identified by their URIs. For more information, see [List Subresources](https://www.twilio.com/docs/usage/api/usage-record#list-subresources).
                    def subresource_uris
                        @properties['subresource_uris']
                    end
                    
                    ##
                    # @return [String] The URI of the resource, relative to `https://api.twilio.com`.
                    def uri
                        @properties['uri']
                    end
                    
                    ##
                    # @return [String] The amount used to bill usage and measured in units described in `usage_unit`.
                    def usage
                        @properties['usage']
                    end
                    
                    ##
                    # @return [String] The units in which `usage` is measured, such as `minutes` for calls or `messages` for SMS.
                    def usage_unit
                        @properties['usage_unit']
                    end
                    
                    ##
                    # Provide a user friendly representation
                    def to_s
                        "<Twilio.Api.V2010.RecordInstance>"
                    end

                    ##
                    # Provide a detailed, user friendly representation
                    def inspect
                        "<Twilio.Api.V2010.RecordInstance>"
                    end
                end

             end
             end
            end
        end
    end
end


