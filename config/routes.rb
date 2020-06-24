Rails.application.routes.draw do
  root 'reviews#index'

  resources :reviews, except: %i[update edit delete]
end
