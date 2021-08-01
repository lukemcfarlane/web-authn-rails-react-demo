Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: 'login#index'

  resources :users, only: :index
  resources :sessions, only: :create
  delete :session, to: 'sessions#destroy', as: :logout
end
