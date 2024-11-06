# app/serializers/tournament_serializer.rb
class TournamentSerializer < ActiveModel::Serializer
    attributes :id, :title, :description, :deadline, :max_players, :registered_players_count, :registration_fee, :prize, :countdown, :first_place, :second_place, :third_place
  
    def countdown
      object.countdown
    end
  end
  