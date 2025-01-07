class CreateCurrencyPacks < ActiveRecord::Migration[8.0]
  def change
    create_table :currency_packs do |t|
      t.string :currency_id
      t.integer :currency_number
      t.float :price
      t.float :unit_price

      t.timestamps
    end
  end
end
