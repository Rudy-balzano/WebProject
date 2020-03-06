Rails.application.routes.draw do

  root to:'homes#index', as: 'homes'

  get '/salut(/:name)', to:'pages#salut', as: 'bonjour'

  resources :connects

  resources :articles

  get 'article#clothes', to: 'articles#clothes', as: 'clothes'

  get 'articles#others', to: 'articles#others', as: 'others'

  resources :clients

  resources :sessions

  post 'session#destroy', to:'sessions#destroy', as: 'deco'

  resources :contients

  resources :paniers

  resources :admins

  resources :categories

  get 'panier#confirm', to:'paniers#confirm', as: 'confirm'

end
