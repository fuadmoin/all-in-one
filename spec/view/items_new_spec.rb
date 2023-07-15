require 'rails_helper'

RSpec.describe 'items/new', type: :system do
  let(:user) do
    User.create!(fname: 'John', mname: 'Doe', lname: 'Smith', email: 'john@example.com', password: 'password')
  end
  let(:category) { Category.create!(name: 'Books', icon: 'book', user_id: user.id) }

  before do
    user.confirm
    login_as(user, scope: :user)
  end

  it 'renders new item form' do
    visit add_new_item_path

    expect(page).to have_field('item[name]')
    expect(page).to have_field('item[amount]')
    expect(page).to have_field('item[unit_price]')
  end
end
