Rails.application.routes.draw do
  devise_for :users
  resources :users
  resources :chats
  resources :messages

  root 'pages#home'

end
