Rails.application.routes.draw do

resources :about
devise_for :users
root to: "home#index"
resources :users
resources :books


end
