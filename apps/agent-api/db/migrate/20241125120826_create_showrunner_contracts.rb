class CreateShowrunnerContracts < ActiveRecord::Migration[8.0]
  def change
    create_table :showrunner_contracts do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name, null: false
      t.references :rarity, null: false, foreign_key: true
      t.float :purchase_price

      t.timestamps
    end
  end
end
