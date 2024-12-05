class FixturesController < ApplicationController
    before_action :validate_season, only: [:index]
  
    # Endpoint to fetch filtered fixtures
    def index
      season = params[:season] || current_season # Use provided season or fallback to the current season
      api_service = ApiFootballService.new
  
      # Fetch fixtures data from the service
      fixtures_data = api_service.fetch_filtered_fixtures(season)
  
      # Handle errors from the API service
      if fixtures_data.is_a?(Hash) && fixtures_data[:error]
        render json: { error: fixtures_data[:error] }, status: :bad_request
      else
        paginated_fixtures = Kaminari.paginate_array(fixtures_data)
                                     .page(params[:page])
                                     .per(params[:per_page] || 10) # Default: 10 fixtures per page
  
        render json: {
          data: paginated_fixtures,
          meta: pagination_meta(paginated_fixtures)
        }, status: :ok
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
  
    # Pagination metadata
    def pagination_meta(collection)
      {
        current_page: collection.current_page,
        total_pages: collection.total_pages,
        total_count: collection.total_count
      }
    end
  end
  