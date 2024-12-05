class CreateMatchSeatBookings < ActiveRecord::Migration[7.0]
  def change
    create_table :match_seat_bookings do |t|
      t.string :seat_number, null: false
      t.integer :match_id, null: false
      t.date :booking_date, null: false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end

    add_index :match_seat_bookings, [:seat_number, :match_id], unique: true
  end
end
