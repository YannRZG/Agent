# spec/models/user_spec.rb
require 'rails_helper'

RSpec.describe User, type: :model do
  it 'is valid with valid attributes' do
    user = User.new(email_address: 'test@example.com', openloot_id: 'test', password: 'password123')
    expect(user).to be_valid
  end

  it 'is invalid without an email_address' do
    user = User.new(openloot_id: 'test', password: 'password123')
    expect(user).to_not be_valid
  end
end
