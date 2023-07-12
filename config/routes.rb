Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    get '/users/sign_out', to: 'devise/sessions#destroy'
  end
  root "users#splash_screen"
  resources :categories, only: %i[index show create] do
    resources :items, only: %i[index]
  end
  resources :items, only: %i[ new create]
  get '/add_new_category', to: 'categories#new'
  get '/add_new_item', to: 'items#new'
end
