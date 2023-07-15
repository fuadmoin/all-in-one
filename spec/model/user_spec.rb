require 'rails_helper'

RSpec.describe User, type: :model do
  it 'is valid with valid attributes' do
    user = User.new(fname: 'John', mname: 'Doe', lname: 'Smith', email: 'john@example.com', password: 'password')
    expect(user).to be_valid
  end

  it 'is not valid without a first name' do
    user = User.new(fname: nil)
    expect(user).not_to be_valid
  end

  it 'is not valid without a middle name' do
    user = User.new(mname: nil)
    expect(user).not_to be_valid
  end

  it 'is not valid without a last name' do
    user = User.new(lname: nil)
    expect(user).not_to be_valid
  end
end
