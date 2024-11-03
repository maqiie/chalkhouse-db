class CreateTables < ActiveRecord::Migration[7.0]
  def change
    create_table :tables do |t|
      t.string :name
      t.string :type
      t.boolean :is_available

      t.timestamps
    end
  end
end
