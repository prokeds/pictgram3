Rails.application.routes.draw do

  #get 'topics/new'
  get 'sessions/new'

  root 'pages#index'
  get 'pages/help'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html



  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  resources :users,:only => [:new, :create]
  resources :topics
  resources :comments

  get '/users/search', to: 'users#search'

  get 'favorites/index'
  post '/favorites', to: 'favorites#create'

  resources :topics  do
    resources :favorites, only: [:create, :destroy]
  end

end
