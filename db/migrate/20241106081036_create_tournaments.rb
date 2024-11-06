class CreateTournaments < ActiveRecord::Migration[7.0]
  def change
    create_table :tournaments do |t|
      t.string :title
      t.text :description
      t.datetime :deadline
      t.integer :max_players
      t.integer :registered_players_count
      t.decimal :registration_fee
      t.decimal :prize
      t.string :first_place
      t.string :second_place
      t.string :third_place

      t.timestamps
    end
  end
end
