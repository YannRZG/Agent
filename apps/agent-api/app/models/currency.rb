class Currency < ApplicationRecord
  belongs_to :game, foreign_key: "game_name", primary_key: "name"
  has_many :currency_packs
  validates :name, presence: true, uniqueness: true
  validates :price, numericality: { greater_than_or_equal_to: 0 }
end
