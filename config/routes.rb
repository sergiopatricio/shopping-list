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
    put :add_item
    put :remove_item
  end
  resource :order, only: %i[show destroy] do
    put :confirm_item
    put :unconfirm_item
  end
  resource :user, only: %i[edit update] do
    collection do
      patch :update_password
    end
  end
end
