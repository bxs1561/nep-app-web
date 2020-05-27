Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  namespace :api do

    # mount_devise_token_auth_for 'User', at: 'auth'
    namespace :v1 do
      # resources :store_images, only:[:index, :show, :update] do
      get 'location', to: 'locations#index'
      # get 'image-stores', to: 'images#new'
      post 'locations', to: 'locations#create'
      get '/location/:id', to: 'locations#index'


      # post 'image-stores', to: 'images#create'
    end

  end
  get '/locations', to:'locations#locations'
  get '/locations/new', to:'locations#new'
  post '/locations/new', to:'locations#create'
  post '/locations', to:'locations#create'

  # get '/coord', to: 'locations#convert'


  # post '/locations/new', to:'images#create'
  # post '/images', to:'images#create'
  #
     root 'homes#home'
  resources :locations
end
