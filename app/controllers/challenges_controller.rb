# app/controllers/challenges_controller.rb
class ChallengesController < ApplicationController
    before_action :set_challenge, only: %i[show accept]
  
    # GET /challenges
    def index
      @challenges = Challenge.all
      render json: @challenges
    end
  
    # POST /challenges
    def create
      @challenge = Challenge.new(challenge_params)
  
      if @challenge.save
        send_sms_notification(@challenge)  # Send SMS notification
        render json: @challenge, status: :created
      else
        render json: @challenge.errors, status: :unprocessable_entity
      end
    end
  
    # GET /challenges/:id
    def show
      render json: @challenge
    end
  
    # POST /challenges/:id/accept
    def accept
        @challenge = Challenge.find(params[:id])
        if @challenge.update(accepted: true)
          render json: @challenge, status: :ok
        else
          render json: { error: 'Unable to accept challenge' }, status: :unprocessable_entity
        end
      end
      
  
    private
  
    def set_challenge
      @challenge = Challenge.find(params[:id])
    end
  
    def challenge_params
      params.require(:challenge).permit(:player, :phone, :game, :price)
    end
  
    # Method to send SMS notification
    def send_sms_notification(challenge)
      client = Twilio::REST::Client.new(ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN'])
  
      client.messages.create(
        from: ENV['TWILIO_PHONE_NUMBER'],
        to: challenge.phone,
        body: "You have created a challenge in #{challenge.game} with a prize of #{challenge.price}. If someone accepts it, you will be notified."
      )
    end
  end
  