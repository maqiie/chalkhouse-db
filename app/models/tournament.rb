# app/models/tournament.rb
class Tournament < ApplicationRecord
    validates :title, :deadline, :max_players, :registration_fee, :prize, presence: true
    validates :max_players, numericality: { only_integer: true, greater_than: 0 }
    validates :registration_fee, :prize, numericality: { greater_than_or_equal_to: 0 }
  
    # Initialize registered_players_count to 0 if not set
    after_initialize :set_default_values, if: :new_record?
  
    def set_default_values
      self.registered_players_count ||= 0
    end
  
    # Countdown to registration deadline
    def countdown
      [deadline - Time.current, 0].max
    end
  
    # Register a player if slots are available
    def register_player
      if can_register?
        increment!(:registered_players_count)
      else
        errors.add(:base, "Tournament is full")
        false
      end
    end
  
    # Check if players can still register
    def can_register?
      registered_players_count < max_players
    end
  
    # Assign winners (pass player names or IDs)
    def assign_winners(first:, second:, third:)
      update(first_place: first, second_place: second, third_place: third)
    end
  end
  