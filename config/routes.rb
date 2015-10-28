Rails.application.routes.draw do

  get 'requests/create'

  get 'requests/destroy'

  get 'requests/index'

  root 'lights#show', id: 'beer30'

  resources :lights do
    resources :requests, only: [:create, :destroy, :index]
  end

  get '/lights/:id/change/:color', to: 'lights#change', as: 'change_light'
  get '/lights/:id/watch', to: 'lights#watch', as: 'watch_light'
  get '/lights/:id/unwatch', to: 'lights#unwatch', as: 'unwatch_light'

  resources :users

  resources :sessions, only: [:create, :destroy]
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'signin', to: 'sessions#login', as: 'signin'
  get 'signout', to: 'sessions#destroy', as: 'signout'

  get '/:id', to: 'lights#show'

end
