Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions' }
  root 'home#index'

  resources :groups, except: :show do
    member do
      patch :status
    end
  end
  resources :items, controller: 'items/base', only: %i[edit update destroy]
  namespace :items do
    resources :regulars, only: %i[index new create]
    resources :temporaries, only: %i[new create]
  end
  resource :shopping_cart, only: %i[show destroy] do
    resources :items, only: :update, controller: 'shopping_carts/items'
  end
  resource :order, only: %i[show destroy] do
    resources :items, only: :update, controller: 'orders/items'
  end
  resource :user, only: %i[edit update] do
    collection do
      patch :update_password
    end
  end
end
