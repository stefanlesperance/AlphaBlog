Rails.application.routes.draw do
  root 'pages#home'
  get 'pages/about'
  get 'articles' => 'articles#show'
  resources :articles
end
