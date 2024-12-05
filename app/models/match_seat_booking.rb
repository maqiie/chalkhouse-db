class MatchSeatBooking < ApplicationRecord
  belongs_to :user
  validates :seat_number, uniqueness: { scope: :match_id, message: "is already booked for this match" }
end
