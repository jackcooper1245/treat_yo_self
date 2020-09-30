Rails.application.routes.draw do
  root 'welcome#index'
  resources :treats
  resources :lists
  resources :budget

  resources :users, only: [:create, :edit, :update, :destroy]  do
    resources :budget
    resources :lists
    resources :treats
  end

  get 'random', to: 'treats#random'
  get 'signup', to: 'users#new'
  get 'profile', to: 'users#show'
  get 'login', to: "sessions#new"
  post 'login', to: "sessions#create"
  get 'logout', to: "sessions#destroy"
end
