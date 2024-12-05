# require 'uri'
# require 'net/http'

# class ApiFootballService
#   BASE_URL = "https://api-football-v1.p.rapidapi.com/v3"

#   def initialize
#     @api_key = ENV['RAPIDAPI_KEY'] # Securely store your API key in an environment variable
#     @api_host = 'api-football-v1.p.rapidapi.com'
#   end

#   # Fetch fixtures for a specific league
#   def fetch_fixtures(league_id, season)
#     url = URI("#{BASE_URL}/fixtures?league=#{league_id}&season=#{season}")

#     http = Net::HTTP.new(url.host, url.port)
#     http.use_ssl = true

#     request = Net::HTTP::Get.new(url)
#     request["x-rapidapi-key"] = @api_key
#     request["x-rapidapi-host"] = @api_host

#     response = http.request(request)
#     JSON.parse(response.read_body) # Parse response to JSON
#   rescue => e
#     { error: "Failed to fetch data: #{e.message}" }
#   end
# end

# class ApiFootballService
#     BASE_URL = "https://api-football-v1.p.rapidapi.com/v3"
  
#     def initialize
#       @api_key = ENV['RAPIDAPI_KEY'] # Use environment variables for security
#       @api_host = 'api-football-v1.p.rapidapi.com'
#     end
  
#     def fetch_filtered_fixtures(season)
#       leagues = {
#         premier_league: 39,    # Premier League ID
#         champions_league: 2,  # Champions League ID
#         la_liga: 140          # La Liga ID
#       }
  
#       # Fetch all fixtures for the selected leagues
#       all_fixtures = leagues.transform_values do |league_id|
#         fetch_fixtures(league_id, season)
#       end
  
#       {
#         upcoming: filter_upcoming_fixtures(all_fixtures),
#         hot: filter_hot_fixtures(all_fixtures),
#         leagues: all_fixtures
#       }
#     end
  
#     # private
  
#     # Fetch fixtures for a specific league and season
#     def fetch_fixtures(league_id, season)
#       url = URI("#{BASE_URL}/fixtures?league=#{league_id}&season=#{season}")
  
#       http = Net::HTTP.new(url.host, url.port)
#       http.use_ssl = true
  
#       request = Net::HTTP::Get.new(url)
#       request["x-rapidapi-key"] = @api_key
#       request["x-rapidapi-host"] = @api_host
  
#       response = http.request(request)
#       JSON.parse(response.read_body)["response"]
#     rescue => e
#       { error: "Failed to fetch data: #{e.message}" }
#     end
  
#     # Filter for the next 5 upcoming fixtures
#     def filter_upcoming_fixtures(fixtures)
#       fixtures.values.flatten.sort_by { |fixture| fixture["fixture"]["date"] }.first(5)
#     end
  
#     # Filter "hot" fixtures (e.g., specific team matchups)
#     def filter_hot_fixtures(fixtures)
#       # Customize logic for "hot" fixtures, e.g., popular teams or derbies
#       fixtures.values.flatten.select do |fixture|
#         ["Manchester United", "Barcelona", "Real Madrid"].include?(fixture["teams"]["home"]["name"]) ||
#           ["Manchester United", "Barcelona", "Real Madrid"].include?(fixture["teams"]["away"]["name"])
#       end
#     end
#   end
  
class ApiFootballService
    BASE_URL = "https://api-football-v1.p.rapidapi.com/v3"
    LEAGUES = {
      premier_league: 39,    # Premier League ID
      champions_league: 2,  # Champions League ID
      la_liga: 140          # La Liga ID
    }.freeze
  
    POPULAR_TEAMS = ["Manchester United", "Barcelona", "Real Madrid"].freeze
  
    def initialize(api_key = ENV['RAPIDAPI_KEY'])
      @api_key = api_key
      @api_host = 'api-football-v1.p.rapidapi.com'
    end
  
    # Main method to fetch and filter fixtures
    def fetch_filtered_fixtures(season)
      all_fixtures = LEAGUES.transform_values { |league_id| fetch_fixtures(league_id, season) }
  
      {
        upcoming: filter_upcoming_fixtures(all_fixtures),
        hot: filter_hot_fixtures(all_fixtures),
        leagues: all_fixtures
      }
    end
  
    private
  
    # Fetch fixtures for a specific league and season
    def fetch_fixtures(league_id, season)
      url = "#{BASE_URL}/fixtures?league=#{league_id}&season=#{season}"
      fetch_data(url)
    end
  
    # Reusable method for API requests
    def fetch_data(url)
      uri = URI(url)
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true
  
      request = Net::HTTP::Get.new(uri)
      request["x-rapidapi-key"] = @api_key
      request["x-rapidapi-host"] = @api_host
  
      response = http.request(request)
      JSON.parse(response.body)["response"]
    rescue => e
      Rails.logger.error("API Error: #{e.message}")
      { error: "Failed to fetch data: #{e.message}" }
    end
  
    # Filters the next 5 upcoming fixtures
    def filter_upcoming_fixtures(fixtures)
      fixtures.values.flatten.sort_by { |fixture| fixture["fixture"]["date"] }.first(5)
    end
  
    # Filters "hot" fixtures based on popular teams
    def filter_hot_fixtures(fixtures)
      fixtures.values.flatten.select do |fixture|
        POPULAR_TEAMS.include?(fixture["teams"]["home"]["name"]) ||
          POPULAR_TEAMS.include?(fixture["teams"]["away"]["name"])
      end
    end
  end
  