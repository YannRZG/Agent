class CreateCurrencies < ActiveRecord::Migration[8.0]
  def change
    create_table :currencies do |t|
      t.string :name, null: false, index: { unique: true }
      t.string :game_name, null: false
      t.boolean :on_chain, default: false
      t.float :price

      t.timestamps
    end
    add_foreign_key :currencies, :games, column: :game_name, primary_key: :name
  end
end
