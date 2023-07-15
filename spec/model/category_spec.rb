require 'rails_helper'

RSpec.describe Category, type: :model do
  it 'is valid with valid attributes' do
    user = User.create(fname: 'John', mname: 'Doe', lname: 'Smith', email: 'john@example.com', password: 'password')
    category = Category.new(name: 'Books', icon: 'book', user_id: user.id)
    expect(category).to be_valid
  end

  it 'is not valid without a name' do
    category = Category.new(name: nil)
    expect(category).not_to be_valid
  end

  it 'is not valid without an icon' do
    category = Category.new(icon: nil)
    expect(category).not_to be_valid
  end
end
