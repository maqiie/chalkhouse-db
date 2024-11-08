class Booking < ApplicationRecord
  belongs_to :table

  # Validations for the essential fields
  validates :name, :phone, :date, :time, :guests, presence: true

  # Validations for the new time-related fields
  validates :start_time, presence: true
  validates :end_time, presence: true
  validates :duration, presence: true

  # Optionally, you can add logic to calculate the duration before saving the record
  before_save :calculate_duration

  private

  # Calculates the duration in minutes based on start_time and end_time
  def calculate_duration
    self.duration = ((end_time - start_time) * 24 * 60).to_i if start_time && end_time
  end
end
