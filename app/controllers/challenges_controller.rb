class ChallengesController < ApplicationController
    def index
        challenges = Challenge.all
        render json: challenges
    end

    def create
        challenge = Challenge.new(challenge_params)
        if challenge.save
            render json: challenge, status: :created
        else
            render json: challenge.errors, status: :unprocessable_entity
        end
    end

    private

    def challenge_params
        params.require(:challenge).permit(:player, :game, :prize)
    end
end
