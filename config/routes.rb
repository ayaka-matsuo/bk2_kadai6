Rails.application.routes.draw do

get "home/about" => "about#index"
devise_for :users
root to: "home#index"
resources :users
resources :books do
	resource :favorite, only: [:destroy, :create]
	resources :book_comments, only: [:create, :destroy]
end


end
