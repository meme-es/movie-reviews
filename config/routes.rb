Rails.application.routes.draw do
  root 'reviews#index'

  resources :users, only: %i[new create]
  resources :reviews, except: %i[update edit delete]
  resources :categories, except: %i[update edit delete]
end
