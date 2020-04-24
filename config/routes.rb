Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions' }
  root 'shopping_lists#show'

  resource :shopping_list, only: %i[show destroy], path: '/'
  namespace :shopping_list do
    resources :items, only: :update
  end
  resource :order, only: %i[show destroy]
  namespace :order do
    resources :items, only: :update
  end

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

  resource :user, only: %i[edit update] do
    collection do
      patch :update_password
    end
  end

  get '/shopping_list', to: redirect('/')
  get '/shopping_cart', to: redirect('/')
end
