Rails.application.routes.draw do
  resources :users
  resources :chats
  resources :messages

  root 'pages#home'

end
