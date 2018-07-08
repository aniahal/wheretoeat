Rails.application.routes.draw do
  devise_for :users
  root 'restaurants#index'
  resources :restaurants do
    member do
      delete 'favourites', action: :destroy, controller: :favourites
      post 'favourites', action: :create, controller: :favourites
    end
  end
end