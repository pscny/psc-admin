PscAdmin::Application.routes.draw do
  get "sessions/create"

  match 'auth/:provider/callback', :controller => :sessions, :action => :create
  match 'sign_in',                 :controller => :sessions, :action => :new,     :as => :sign_in
  match 'sign_out',                :controller => :sessions, :action => :destroy, :as => :sign_out

  resources :admins
  resources :subscribers
  resources :concert_series
  resources :concerts

  root :to => 'subscribers#index'
end
