class CreateUserRecharges < ActiveRecord::Migration[8.0]
  def change
    create_table :user_recharges do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :discount_time
      t.integer :discount_number

      t.timestamps
    end
  end
end
