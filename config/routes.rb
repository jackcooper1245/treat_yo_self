Rails.application.routes.draw do
  root 'welcome#index'
  resources :treats
  resources :budgets
  resources :lists
  resources :users
  get 'signup', to: 'users#new'
  get 'profile', to: 'users#show'
  get 'login', to: "sessions#new"
  post 'login', to: "sessions#create"
  get 'logout', to: "sessions#destroy"
end
