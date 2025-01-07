class Slot < ApplicationRecord
  belongs_to :game
  belongs_to :rarity
  # belongs_to :match
end
