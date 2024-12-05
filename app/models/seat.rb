# app/models/seat.rb
class Seat < ApplicationRecord
    belongs_to :match
    validates :seat_number, presence: true
    enum status: { available: 0, booked: 1 }
  
    # Additional logic to manage seat booking status could go here
  end
  