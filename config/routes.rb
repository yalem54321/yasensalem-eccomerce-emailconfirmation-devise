Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
devise_for :users, :controllers => {
    :registrations => "registrations", 
    :confirmations => "confirmations",
    }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :pages, only: [:index]
    root 'pages#index'
    devise_scope :user do
    get 'login', to: 'devise/sessions#new'
  end
 devise_scope :user do
    get 'logout', to: 'pages#index'
  end
  devise_scope :user do
    get 'signup', to: 'devise/registrations#new'
  end
    root to: 'pages#index'
    get 'orders', to: 'orders#index'
  post '/orders/submit', to: 'orders#submit'
  post 'orders/paypal/create_payment'  => 'orders#paypal_create_payment', as: :paypal_create_payment
  post 'orders/paypal/execute_payment'  => 'orders#paypal_execute_payment', as: :paypal_execute_payment
  post 'orders/paypal/create_subscription'  => 'orders#paypal_create_subscription', as: :paypal_create_subscription
  post 'orders/paypal/execute_subscription'  => 'orders#paypal_execute_subscription', as: :paypal_execute_subscription
end