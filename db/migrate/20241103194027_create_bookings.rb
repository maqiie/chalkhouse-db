class CreateBookings < ActiveRecord::Migration[7.0]
  def change
    create_table :bookings do |t|
      t.string :name
      t.string :phone
      t.date :date
      t.time :time
      t.integer :guests
      t.references :table, null: false, foreign_key: true

      t.timestamps
    end
  end
end
