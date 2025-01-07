class User < ApplicationRecord
  has_many :badges
  has_many :showrunner_contracts
  has_secure_password
  has_many :sessions, dependent: :destroy

  # Associe des badges et des showrunner_contracts à l'utilisateur via assetable
  has_many :assets, as: :assetable

  validates :email_address, presence: true
  validates :openloot_id, presence: true, uniqueness: true
end
