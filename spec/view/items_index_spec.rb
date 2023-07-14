require 'rails_helper'

RSpec.describe "items/index", type: :view do
  let(:user) { User.create!(fname: 'John', mname: 'Doe', lname: 'Smith', email: 'john@example.com', password: 'password') }
  let(:category) { Category.create!(name: 'Books', icon: 'book', user_id: user.id) }
  let(:item) { Item.create!(name: 'The Great Gatsby', unit_price: 10.0, amount: 1, author_id: user.id, categories: [category]) }

  before do
    assign(:category, category)
    assign(:items, [item])
  end

  it "renders a list of items" do
    render

    expect(rendered).to have_content("Total: $10.0")
    expect(rendered).to have_content(item.name)
    expect(rendered).to have_content("$10.0")
    expect(rendered).to have_link("New Item", href: add_new_item_path)
  end
end
