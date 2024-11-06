# app/serializers/challenge_serializer.rb
class ChallengeSerializer < ActiveModel::Serializer
  attributes :id, :player, :phone, :game, :price, :accepted, :expiration_time, :expired

  def expired
    object.expired?
  end
end
