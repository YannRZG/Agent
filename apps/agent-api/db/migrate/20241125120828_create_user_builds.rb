class CreateUserBuilds < ActiveRecord::Migration[8.0]
  def change
    create_table :user_builds do |t|
      t.references :user, null: false, foreign_key: true
      t.string :build_name, null: false
      t.float :bonus_multiplier
      t.float :perks_multiplier

      t.timestamps
    end
  end
end
