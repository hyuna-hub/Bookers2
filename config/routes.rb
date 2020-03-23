Rails.application.routes.draw do
  root 'books#top'
  get 'home/about', to: 'books#about'
  devise_for :users
  resources 'books'
  resources 'users'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
