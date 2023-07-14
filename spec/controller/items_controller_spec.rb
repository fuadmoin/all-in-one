require 'rails_helper'

RSpec.describe ItemsController, type: :controller do
  let(:user) { User.create!(fname: 'John', mname: 'Doe', lname: 'Smith', email: 'john@example.com', password: 'password') }
  let(:category) { Category.create!(name: 'Books', icon: 'book', user_id: user.id) }
  let(:item) { Item.create!(name: 'The Great Gatsby', unit_price: 10.0, amount: 1, author_id: user.id, categories: [category]) }

  before do
    user.confirm
    sign_in user
  end

  describe "GET #index" do
    it "assigns all items as @items" do
      get :index, params: { category_id: category.id }
      expect(assigns(:items)).to eq([item])
    end
  end

  describe "GET #new" do
    it "assigns a new item as @item" do
      get :new
      expect(assigns(:item)).to be_a_new(Item)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Item" do
        expect {
          post :create, params: { item: { name: 'The Great Gatsby', unit_price: 10.0, amount: 1, category_ids: [category.id] } }
        }.to change(Item, :count).by(1)
      end

      it "assigns a newly created item as @item" do
        post :create, params: { item: { name: 'The Great Gatsby', unit_price: 10.0, amount: 1, category_ids: [category.id] } }
        expect(assigns(:item)).to be_a(Item)
        expect(assigns(:item)).to be_persisted
      end

      it "redirects to the items index of the first category" do
        post :create, params: { item: { name: 'The Great Gatsby', unit_price: 10.0, amount: 1, category_ids: [category.id] } }
        expect(response).to redirect_to(category_items_path(category))
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved item as @item" do
        post :create, params: { item: { name: nil, unit_price: nil, amount:nil } }
        expect(assigns(:item)).to be_a_new(Item)
      end

      it "re-renders the 'new' template" do
        post :create, params: { item: { name:nil, unit_price:nil, amount:nil } }
        expect(response).to render_template("new")
      end
    end
  end
end
