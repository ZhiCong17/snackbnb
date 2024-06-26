Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  # root to: "pages#index"
  # get 'snacks/:id/edit', to: 'snacks#edit'
  # patch 'snacks/:id', to: 'snacks#update'
  # get 'snack', to: 'snacks#show'

  get 'mine', to: 'snacks#mine'
  # as: 'edit_snack'
  # resources :users do
  #   resources :snacks
  # end
  # patch 'orders/:id', to: 'orders#update', as: :update_order
  resources :orders do
    member do
      patch 'update_status'
    end
  end

  get 'order_history', to: 'orders#order_history'


  resources :snacks do
    member do
      get "add_to_cart", to: "snacks#add_to_cart"
      delete "delete", to: "snacks#destroy"
    end


    resources :order_items, only: [:create]
  end

  resources :order_items, only: [:destroy]
  get 'cart', to: 'orders#cart'
  #, as: 'edit_snack'
end
