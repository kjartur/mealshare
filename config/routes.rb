Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get '/bookings', to: 'bookings#index'
  resources :meals do
    resources :bookings, only: [:new, :create]
  end
  resources :bookings do
    collection do
      post 'confirm'
    end
  end
  get "/my_bookings", to: "bookings#my_bookings"
end
