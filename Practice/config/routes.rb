Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #resources :users

  # get '/users' , to: 'users#index'
  # post '/users', to: 'users#create'
  # get '/users/new', to: 'users#new'
  # get '/users/:id/edit', to: 'users#edit'
  # get '/users/:id', to: 'users#show'
  # patch '/users/:id', to: 'users#update'
  # put '/users/:id', to: 'users#update'
  # delete '/users', to: 'users#destroy'
  
  resources :users, only: [:index, :create, :new,
  :update, :destroy, :show]

  post '/artworks', to: 'artworks#create'
  get '/artworks/new', to: 'artworks#new'
  get '/artworks/:id/edit', to: 'artworks#edit'
  get '/artworks/:id', to: 'artworks#show'
  patch '/artworks/:id', to: 'artworks#update'
  put '/artworks/:id', to: 'artworks#update'
  delete '/artworks/:id', to: 'artworks#destroy'

  resources :art_shares, only: [:create, :destroy]

  resources :users do  
    resources :artworks, only: [:index]
  end

  resources :users do 
    resources :art_shares, only: [:index]
  end

  resources :users do
    resources :comments, only: [:index]
  end

   resources :artworks do
    resources :comments, only: [:index]
  end



  resources :comments, only: [:create, :destroy, :index]
  #get '/users/:user_id/artworks', to: 'artworks#index'

  resources :likes, only: [:create, :index]

  resources :artworks do
    member do 
      get 'favorite'
      post 'favorite'
    end
  end
resources :users do 
  resources :art_shares do 
    member do 
      get 'get_favorite'
      post 'create_favorite'
    end
  end
end
  

  
  
end
