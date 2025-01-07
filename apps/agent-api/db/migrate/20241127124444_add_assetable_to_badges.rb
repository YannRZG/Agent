class AddAssetableToBadges < ActiveRecord::Migration[8.0]
  def change
    add_column :badges, :assetable_id, :integer
    add_column :badges, :assetable_type, :string
  end
end
