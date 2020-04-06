Rails.application.routes.draw do
  root 'homes#top'
  get 'home/about', to: 'homes#about'
  resources 'books'
# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users
  resources :users

  resources :book_comments, only: [:create, :destroy]

end
