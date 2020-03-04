Rails.application.routes.draw do

  root to:'homes#index', as: 'homes'

  get '/salut(/:name)', to:'pages#salut', as: 'bonjour'

  resources :connects

  resources :articles

  resources :clients

  resources :sessions

  post 'session#destroy', to:'sessions#destroy', as: 'deco'

  resources :contients

  resources :paniers

end
