Rails.application.routes.draw do
  devise_for :users
  root 'home#top'
  resources :users
  resources :books
  get 'home/about' =>'home#about'
  resources :post_images, only: [:new, :create, :index, :show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
