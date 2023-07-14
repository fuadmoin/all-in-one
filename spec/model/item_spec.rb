require 'rails_helper'

RSpec.describe Item, type: :model do
  let(:user) { User.create(fname: 'John', mname: 'Doe', lname: 'Smith', email: 'john@example.com', password: 'password') }
  let(:category) { Category.create(name: 'Books', icon: 'book', user_id: user.id) }

  it 'is valid with valid attributes' do
    item = Item.new(name: 'The Great Gatsby', unit_price: 10.0, amount: 1, author_id: user.id, categories: [category])
    expect(item).to be_valid
  end

  it 'is not valid without a name' do
    item = Item.new(name: nil)
    expect(item).not_to be_valid
  end

  it 'is not valid with a non-positive unit price' do
    item = Item.new(unit_price: -1)
    expect(item).not_to be_valid
  end

  it 'is not valid with a non-positive amount' do
    item = Item.new(amount: -1)
    expect(item).not_to be_valid
  end

  it 'is not valid without at least one category' do
    item = Item.new(categories: [])
    expect(item).not_to be_valid
  end
end
