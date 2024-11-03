class Challenge < ApplicationRecord
    has_many :bookings, dependent: :destroy
end
