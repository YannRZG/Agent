class Session < ApplicationRecord
  belongs_to :user

  def active?
    created_at >= 2.weeks.ago # Expiration après 2 semaines
  end
end
