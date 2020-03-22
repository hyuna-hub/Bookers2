Rails.application.routes.draw do
  root 'books#top'
  get '/home/about', to: 'books#about'
  resources 'books'
  devise_for :users
  resources 'users'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
