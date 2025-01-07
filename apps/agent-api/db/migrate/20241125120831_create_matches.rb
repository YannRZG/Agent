class CreateMatches < ActiveRecord::Migration[8.0]
  def change
    create_table :matches do |t|
      t.references :user, null: false, foreign_key: true
      t.string :build, null: false
      t.datetime :date, null: false
      t.string :map, null: false
      t.integer :total_fee
      t.float :fee_cost
      t.string :slots
      t.float :luckrate
      t.integer :time
      t.integer :energy_used
      t.float :energy_cost
      t.integer :total_token
      t.float :token_value
      t.integer :total_premium_currency
      t.float :premium_currency_value
      t.float :profit
      t.float :bonus_multiplier
      t.float :perks_multiplier

      t.timestamps
    end
  end
end
