Rails.application.routes.draw do
  devise_for :users
  post 'items/new'

  root to:"items#index"

  resources :items
end
