class AddAssetableToShowrunnerContracts < ActiveRecord::Migration[8.0]
  def change
    add_column :showrunner_contracts, :assetable_id, :integer
    add_column :showrunner_contracts, :assetable_type, :string
  end
end
