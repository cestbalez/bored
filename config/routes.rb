Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :boards do
    resources :bookings, only: [:new, :create, :index]
    resources :reviews, only: [:new, :create, :index]
  end
  get 'dashboard', to: 'users#dashboard', as: 'user_dashboard'
end
