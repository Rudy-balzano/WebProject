Rails.application.routes.draw do

  root to:'home#index', as: 'home'

  get '/salut(/:name)', to:'pages#salut', as: 'bonjour'

  resources :connects

  resources :articles

  resources :clients

  resources :sessions

end
