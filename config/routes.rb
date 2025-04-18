Rails.application.routes.draw do
  get "messages/index"
  get "messages/show"
  get "chats/index"
  get "chats/show"
  get "users/index"
  get "users/show"
  root 'pages#home'
  get 'about', to: 'pages#about'
  get 'contact', to: 'pages#contact'
  post 'contact', to: 'pages#contact'
  resources :users, only: [:index, :show]
  resources :chats, only: [:index, :show]
  resources :messages, only: [:index, :show]
  root "users#index"
end
