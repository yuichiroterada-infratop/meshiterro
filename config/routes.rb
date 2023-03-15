Rails.application.routes.draw do
  devise_for :users
  root to: "homes#top"
  get "/top" => 'homes#top'
  get "homes/about", as: "about"
  resources :post_images, only: [:new,:create, :index, :show, :destroy]
  resources :users, only: [:show, :edit]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
