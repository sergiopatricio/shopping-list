Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions' }
  root 'home#index'

  resources :groups, except: :show
  resources :items, except: :show
  resource :shopping_cart, only: %i[show destroy] do
    put :add_item
    put :remove_item
  end
end
