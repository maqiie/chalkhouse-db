class Booking < ApplicationRecord
  belongs_to :table
  validates :name, :phone, :date, :time, :guests, presence: true
end
