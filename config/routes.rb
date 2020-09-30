Rails.application.routes.draw do
  root 'welcome#index'
  resources :treats
  resources :lists
  resources :budgets

  resources :users, only: [:create, :edit, :update, :destroy]  do
    resources :budgets, only: [:new, :create, :edit, :update, :destroy]
  end
  get 'signup', to: 'users#new'
  get 'profile', to: 'users#show'
  get 'login', to: "sessions#new"
  post 'login', to: "sessions#create"
  get 'logout', to: "sessions#destroy"
end
