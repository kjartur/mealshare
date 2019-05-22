Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :meals do
    resources :bookings, only: [:index, :new, :create]
  end
  get "/my_bookings", to: "bookings#my_bookings"
end
