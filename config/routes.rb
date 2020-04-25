Rails.application.routes.draw do
  devise_for :users
  root 'home#top'
  resources :users
  get 'home/about' =>'home#about'
  resources :post_images, only: [:new, :create, :index, :show]
  resource :favorites, only: [:create, :destroy]
  resources :books do
  resource :book_comments, only: [:create]
end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
