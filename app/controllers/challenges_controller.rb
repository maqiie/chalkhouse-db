class FixturesController < ApplicationController
  before_action :initialize_service

  def index
    season = params[:season] || 2023 # Default to the 2023 season if no season is provided

    leagues = {
      premier_league: 39,        # Premier League ID
      champions_league: 2,      # Champions League ID
      la_liga: 140              # La Liga ID
    }

    @fixtures = leagues.transform_values do |league_id|
      fixtures = @service.fetch_fixtures(league_id, season)

      # Log the fixtures structure for debugging purposes
      Rails.logger.debug("Fixtures for league #{league_id}: #{fixtures.inspect}")

      # Safely access the response key and filter upcoming fixtures
      response = fixtures.is_a?(Hash) ? fixtures["response"] : nil

      if response.nil?
        Rails.logger.debug("No response for league #{league_id}: #{fixtures.inspect}")
      end

      # Filter and return upcoming fixtures, or empty array if response is nil
      filter_upcoming_fixtures(response)
    end

    render json: @fixtures
  end

  def premier_league
    render_league_fixtures(39, params[:season] || 2024)
  end

  def champions_league
    render_league_fixtures(2, params[:season] || 2023)
  end

  def la_liga
    render_league_fixtures(140, params[:season] || 2023)
  end

  private

  # Initialize API service
  def initialize_service
    @service = ApiFootballService.new
  end

  # Fetch and render fixtures for a specific league and season
  def render_league_fixtures(league_id, season)
    fixtures = @service.fetch_fixtures(league_id, season)
    @fixtures = filter_upcoming_fixtures(fixtures.dig("response"))
    render json: @fixtures
  end

  # Helper method to filter out finished fixtures
  def filter_upcoming_fixtures(fixtures)
    return [] unless fixtures.is_a?(Array)

    fixtures.select do |fixture|
      fixture.dig("fixture", "status", "short") != "FT"
    end
  end
end
