class CreateChallenges < ActiveRecord::Migration[7.0]
  def change
    create_table :challenges do |t|
      t.string :player
      t.string :phone
      t.string :game
      t.decimal :price
      t.boolean :accepted
      t.datetime :expiration_time

      t.timestamps
    end
  end
end
