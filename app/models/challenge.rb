# app/models/challenge.rb
class Challenge < ApplicationRecord
    validates :player, :phone, :game, :price, presence: true
    validates :price, numericality: { greater_than_or_equal_to: 0 }
  
    # Set expiration time to 72 hours from challenge creation
    before_create :set_expiration_time
  
    def set_expiration_time
      self.expiration_time = Time.current + 72.hours
    end
  
    # Check if the challenge is expired
    def expired?
      Time.current > expiration_time
    end
  
    # Accept a challenge
    def accept_challenge
      if expired?
        errors.add(:base, "Challenge has expired")
        false
      else
        update(accepted: true)
        true
      end
    end
  end
  