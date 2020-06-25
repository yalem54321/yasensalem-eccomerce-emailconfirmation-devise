Rails.application.routes.draw do
devise_for :users, :controllers => {
    :registrations => "registrations", 
    :confirmations => "confirmations",
    }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :pages, only: [:index]
    root 'pages#index'
    devise_scope :user do
  get 'login', to: 'devise/sessions#new'
        devise_scope :user do
  get 'signup', to: 'devise/registrations#new'
end
end
end
