require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let(:user) { User.create!(fname: 'John', mname: 'Doe', lname: 'Smith', email: 'john@example.com', password: 'password') }

  before do
    user.confirm
    sign_in user
  end

  describe "GET #splash_screen" do
    it "assigns the title as @title" do
      get :splash_screen
      expect(assigns(:title)).to eq("Splash Screen")
    end
  end
end
