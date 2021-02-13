Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'pages#home'
  #get 'pages/home', to: 'pages#home'
  get 'about', to: 'pages#about' #/about au lieu de pages/about ; about est le nom du controller
  #get 'destroy', to: 'articles#destroy'
  resources :articles #rajoute des routes comme new/show/destroy/creat

  get "sign_up", to: "users#new"
  resources :users, except: (:new) #creation des liens

  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy"
end
