class CreateSlots < ActiveRecord::Migration[8.0]
  def change
    create_table :slots do |t|
      t.string :game
      t.integer :unlock_price

      t.timestamps
    end
  end
end
