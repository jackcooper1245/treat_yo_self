Rails.application.routes.draw do
  root 'welcome#index'
  get '/auth/facebook' => 'sessions#create_with_facebook'
  resources :treats
  resources :lists do  
    resources :lts
  end
  resources :budget
  resources :lts
  resources :users, only: [:create, :edit, :update, :destroy]  do
    resources :budget
    resources :lists do
      resources :treats do
        get 'add_treat', to: 'lists#add_treat'
        get 'remove_treat', to: 'lists#remove_treat'
        get 'select_treat', to: 'lists#select_treat'
      end
    end
    resources :treats
  end
    
  get 'edit_total', to: 'budget#edit_total'
  get 'random', to: 'treats#random'
  get 'signup', to: 'users#new'
  get 'profile', to: 'users#show'
  get 'login', to: "sessions#new"
  post 'login', to: "sessions#create"
  get 'logout', to: "sessions#destroy"
end
