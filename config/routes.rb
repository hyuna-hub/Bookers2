Rails.application.routes.draw do
  root 'homes#top'
  get 'home/about', to: 'homes#about'
  get 'users/follow', to: 'users#follow'
  get 'users/follower', to: 'users#follower'
  resources 'books'
# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users
  resources :users

  resources :favorites, only: [:create, :destroy]
  resources :book_comments, only: [:create, :destroy]

  resources :relationships, only: [:create, :destroy]

end
