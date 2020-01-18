Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions' }
  root 'home#index'

  resources :groups, except: :show
  resources :items, except: :show
  resource :shopping_cart, only: %i[show destroy] do
    put :add_item
    put :remove_item
  end
  resource :order, only: %i[show destroy] do
    put :confirm_item
    put :unconfirm_item
  end
end
