Rails.application.routes.draw do
  root 'reviews#index'

  resources :reviews, except: %i[update edit delete]
  resources :categories, except: %i[update edit delete]
end
