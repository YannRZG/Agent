class CreateRarities < ActiveRecord::Migration[8.0]
  def change
    create_table :rarities do |t|
      t.string :name, null: false
      t.integer :max_supply, default: 0
      t.timestamps
    end
  end
end
