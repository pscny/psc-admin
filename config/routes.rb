PscAdmin::Application.routes.draw do
  get "sessions/create"

  devise_for :admins

  match 'auth/:provider/callback', :controller => :sessions, :action => :create
  match 'sign_in',                 :controller => :sessions, :action => :new

  resources :sessions, :only => [ :new ]

  resources :admins
  resources :subscribers
  resources :concert_series
  resources :concerts

  root :to => 'subscribers#index'
end
