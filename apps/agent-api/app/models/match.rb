class Match < ApplicationRecord
  belongs_to :user
  has_many :slots
  has_many :badges, through: :slots
end
