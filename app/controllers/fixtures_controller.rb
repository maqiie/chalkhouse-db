class FixturesController < ApplicationController
    before_action :validate_season, only: [:index]
  
    # Endpoint to fetch filtered fixtures
    def index
      season = params[:season] || current_season # Use provided season or fallback to the current season
      api_service = ApiFootballService.new
  
      fixtures_data = api_service.fetch_filtered_fixtures(season)
  
      if fixtures_data.is_a?(Hash) && fixtures_data[:error]
        render json: { error: fixtures_data[:error] }, status: :bad_request
      else
        render json: fixtures_data, status: :ok
      end
    end
  
    private
  
    # Determine the current season
    def current_season
      current_month = Time.now.month
      current_year = Time.now.year
      current_month >= 7 ? current_year : current_year - 1 # Seasons often start mid-year
    end
  
    # Validate season parameter if provided
    def validate_season
      return if params[:season].blank? || params[:season].match?(/^\d{4}$/)
  
      render json: { error: "Invalid season format. Please use a four-digit year." }, status: :unprocessable_entity
    end
  end
  