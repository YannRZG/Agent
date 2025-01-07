class CurrencyPack < ApplicationRecord
  belongs_to :currency
  belongs_to :game
end
