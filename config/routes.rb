Rails.application.routes.draw do
  get 'dashboard/show'
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :boards do
    resources :bookings, only: [:new, :create, :index]
    resources :reviews, only: [:new, :create, :index]
  end
end
