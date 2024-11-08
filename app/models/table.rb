class Table < ApplicationRecord
    has_many :bookings
  
    # Check if table is available during the requested time
    def available?(start_time, end_time)
      bookings.where("start_time < ? AND end_time > ?", end_time, start_time).empty?
    end
  
    # Suggest an available time slot after the requested time
    def suggest_available_times(requested_start_time, requested_end_time)
      suggested_start_time = requested_end_time
      suggested_end_time = suggested_start_time + 1.hour
  
      # Check for availability of suggested time
      until available?(suggested_start_time, suggested_end_time)
        suggested_start_time = suggested_end_time
        suggested_end_time = suggested_start_time + 1.hour
      end
  
      # Return the suggested time slot as a formatted string
      { suggested_start_time: suggested_start_time.strftime("%Y-%m-%d %H:%M"), 
        suggested_end_time: suggested_end_time.strftime("%Y-%m-%d %H:%M") }
    end
  end
  