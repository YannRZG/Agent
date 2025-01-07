class Rarity < ApplicationRecord
  has_many :showrunner_contracts
  has_many :badges
  validates :name, presence: true
end
