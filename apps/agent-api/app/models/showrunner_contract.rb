class ShowrunnerContract < ApplicationRecord
  belongs_to :user
  belongs_to :rarity
  belongs_to :assetable, polymorphic: true

end
