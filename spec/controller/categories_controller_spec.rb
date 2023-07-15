require 'rails_helper'

RSpec.describe CategoriesController, type: :controller do
  let(:user) do
    User.create(fname: 'John', mname: 'Doe', lname: 'Smith', email: 'john@example.com', password: 'password')
  end
  let(:category) { Category.create(name: 'Books', icon: 'book', user_id: user.id) }

  before do
    user.confirm
    sign_in user
  end

  describe 'GET #index' do
    it 'assigns all categories as @categories' do
      get :index
      expect(assigns(:categories)).to eq([category])
    end
  end

  describe 'GET #new' do
    it 'assigns a new category as @category' do
      get :new
      expect(assigns(:category)).to be_a_new(Category)
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new Category' do
        expect do
          post :create, params: { category: { name: 'Books', icon: 'book' } }
        end.to change(Category, :count).by(1)
      end

      it 'assigns a newly created category as @category' do
        post :create, params: { category: { name: 'Books', icon: 'book' } }
        expect(assigns(:category)).to be_a(Category)
        expect(assigns(:category)).to be_persisted
      end

      it 'redirects to the categories index' do
        post :create, params: { category: { name: 'Books', icon: 'book' } }
        expect(response).to redirect_to(categories_path)
      end
    end

    context 'with invalid params' do
      it 'assigns a newly created but unsaved category as @category' do
        post :create, params: { category: { name: nil, icon: nil } }
        expect(assigns(:category)).to be_a_new(Category)
      end

      it "re-renders the 'new' template" do
        post :create, params: { category: { name: nil, icon: nil } }
        expect(response).to render_template('new')
      end
    end
  end
end
