Rails.application.routes.draw do
  root 'posts#index'
  resources :users
  resources :posts
  resources :sessions, only: [:new, :create]
  delete '/logout' => 'sessions#destroy', as: :logout
end

