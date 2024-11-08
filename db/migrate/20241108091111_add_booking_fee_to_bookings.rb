class AddBookingFeeToBookings < ActiveRecord::Migration[7.0]
  def change
    add_column :bookings, :booking_fee, :integer
  end
end
