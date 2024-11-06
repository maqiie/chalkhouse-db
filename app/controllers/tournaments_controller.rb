# app/controllers/tournaments_controller.rb
class TournamentsController < ApplicationController
    before_action :set_tournament, only: %i[show register countdown assign_winners]
  
    # GET /tournaments
    def index
      @tournaments = Tournament.all
      render json: @tournaments
    end
  
    # POST /tournaments
    def create
      @tournament = Tournament.new(tournament_params)
  
      if @tournament.save
        render json: @tournament, status: :created
      else
        render json: @tournament.errors, status: :unprocessable_entity
      end
    end
  
    # GET /tournaments/:id
    def show
      render json: @tournament
    end
  
    # POST /tournaments/:id/register
    def register
      if @tournament.register_player
        render json: { message: 'Player registered successfully' }, status: :ok
      else
        render json: { errors: @tournament.errors.full_messages }, status: :unprocessable_entity
      end
    end
  
    # POST /tournaments/:id/assign_winners
    def assign_winners
      if @tournament.assign_winners(winner_params)
        render json: { message: 'Winners assigned successfully' }, status: :ok
      else
        render json: { errors: @tournament.errors.full_messages }, status: :unprocessable_entity
      end
    end
  
    # GET /tournaments/:id/countdown
    def countdown
      render json: { countdown: @tournament.countdown }
    end
  
    private
  
    def set_tournament
      @tournament = Tournament.find(params[:id])
    end
  
    def tournament_params
      params.require(:tournament).permit(:title, :description, :deadline, :max_players, :registration_fee, :prize)
    end
  
    def winner_params
      params.require(:tournament).permit(:first_place, :second_place, :third_place)
    end
  end
  