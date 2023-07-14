require 'rails_helper'

RSpec.describe CategoriesController, type: :controller do
  let(:user) { User.create!(fname: 'John', mname: 'Doe', lname: 'Smith', email: 'john@example.com', password: 'password') }
  let(:category) { Category.create!(name: 'Books', icon: 'book', user_id: user.id) }

  before do
    user.confirm
    sign_in user
  end

  describe "GET #index" do
    it "renders a list of categories" do
      get :index
      expect(assigns(:categories)).to eq([category])
    end
  end
end
