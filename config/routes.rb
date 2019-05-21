Rails.application.routes.draw do
  get 'meals/new'
  get 'meals/create'
  get 'meals/edit'
  get 'meals/update'
  get 'meals/destroy'
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
