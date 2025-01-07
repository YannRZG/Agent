class CreateBadges < ActiveRecord::Migration[8.0]
  def change
    create_table :badges do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name
      t.references :rarity, null: false, foreign_key: true
      t.float :efficiency
      t.float :purchase_price

      t.timestamps
    end
  end
end
