Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'pages#home'
  #get 'pages/home', to: 'pages#home'
  get 'about', to: 'pages#about' #/about au lieu de pages/about
  resources :articles
end
