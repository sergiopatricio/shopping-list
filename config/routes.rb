# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions' }
  root 'shopping_lists#show'

  resource :shopping_list, only: %i[show destroy], path: '/'
  namespace :shopping_list do
    resources :items, only: :update
  end
  resource :confirmation, only: %i[show destroy] do
    member do
      delete 'later', action: :destroy_later
    end
  end
  namespace :confirmation do
    resources :items, only: :update
  end

  resources :groups, except: :show do
    collection do
      post 'sort'
    end
    member do
      get 'items'
    end
  end
  resources :items, only: %i[new create edit update destroy] do
    collection do
      post 'sort'
    end
  end

  resource :user, only: %i[edit update] do
    collection do
      patch :update_password
    end
  end

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get 'up' => 'rails/health#show', as: :rails_health_check
end
