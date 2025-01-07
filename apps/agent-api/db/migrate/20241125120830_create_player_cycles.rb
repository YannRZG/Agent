class CreatePlayerCycles < ActiveRecord::Migration[8.0]
  def change
    create_table :player_cycles do |t|
      t.references :user, null: false, foreign_key: true
      t.string :cycle_name
      t.string :player_cycle_type
      t.integer :nb_badge
      t.string :minimum_badge_rarity
      t.datetime :start_date
      t.datetime :end_date
      t.integer :nb_date_repeat

      t.timestamps
    end
  end
end
