Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  config = Rails.application.config.shimo_baukis

  constraints host: config[:staff][:host] do
    namespace :staff, path: config[:staff][:path] do
      root 'top#index'
      get 'login' => 'sessions#new', as: :login
      resource :session, only: [:create, :destroy]
      # post 'session' => 'sessions#create', as: :session
      # delete 'session' => 'sessions#destroy'
      resource :account, except: [:new, :create, :destroy]
    end
  end

  constraints host: config[:admin][:host] do
    namespace :admin, path: config[:admin][:path] do
      root 'top#index'
      get 'login' => 'sessions#new', as: :login
      # post 'session' => 'sessions#create', as: :session
      # delete 'session' => 'sessions#destroy'
      resource :session, only: [:create, :destroy]
      resources :staff_members
    end
  end

  constraints host: config[:customer][:host] do
    namespace :customer, path: config[:customer][:path] do
      root 'top#index'
    end
  end

end
