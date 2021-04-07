Rails.application.routes.draw do
  root 'pages#home'
  get 'pages/about'
  #I believe the below indicates which 'routes' are to be accepted/taken from resources
  resources :articles, only: [:show, :index, :new, :create]
end
