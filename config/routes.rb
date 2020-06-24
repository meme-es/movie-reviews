Rails.application.routes.draw do
  root 'reviews#index'

  resources :users, only: %i[create]
  resources :sessions, only: %i[create]
  resources :reviews, except: %i[update edit delete]
  resources :categories, except: %i[update edit delete]

  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
end
