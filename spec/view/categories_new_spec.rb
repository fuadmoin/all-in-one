require 'rails_helper'

RSpec.describe "categories/new", type: :system do
  let(:user) { User.create!(fname: 'John', mname: 'Doe', lname: 'Smith', email: 'john@example.com', password: 'password') }

  before do
    user.confirm
    login_as(user, scope: :user)
  end

  it "renders the new category form" do
    visit add_new_category_path
    expect(page).to have_selector("input[name='category[name]']")
    expect(page).to have_selector("input[name='category[icon]']")
    expect(page).to have_button('Create Category')
  end
end
