class CreateChallenges < ActiveRecord::Migration[7.0]
  def change
    create_table :challenges do |t|
      t.string :player
      t.string :game
      t.decimal :prize

      t.timestamps
    end
  end
end
