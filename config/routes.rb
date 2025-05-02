Rails.application.routes.draw do
  resources :users
  resources :chats
  resources :messages

  root "users#index"
end
