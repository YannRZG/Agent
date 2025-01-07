class CreateUsers < ActiveRecord::Migration[8.0]
  def change
    create_table :users do |t|
      t.string :email_address, null: false
      t.string :password_digest, null: false
      t.string "openloot_id", null: false
      t.boolean "is_premium"
      t.integer "level"
      t.integer "experience"
      t.string "asset_type"
      t.string "asset_id"

      t.timestamps
    end
    add_index :users, :email_address, unique: true
  end
end
