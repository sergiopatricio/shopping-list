# frozen_string_literal: true

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
    collection do
      post 'sort'
    end
    member do
      get 'items'
    end
  end
  resources :items, only: %i[new create edit update destroy] do
    collection do
      get 'regular'
      post 'sort'
    end
  end

  resource :user, only: %i[edit update] do
    collection do
      patch :update_password
    end
  end
end
