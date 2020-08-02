Rails.application.routes.draw do

get "home/about" => "about#index"
devise_for :users
root to: "home#index"
resources :users
resources :books do
	resources :favorite, only: [:destroy, :create]
end


end
