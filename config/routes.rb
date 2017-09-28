Rails.application.routes.draw do
  root 'users#index'
  resources :users
  resources :sessions, only: [:new, :create]
  delete 'logout' => 'sessions#destroy', as: :logout
  resources :posts
  resources :comments
  get '/list_users' => 'users#list_users', as: :users_list
end
