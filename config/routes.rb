PscAdmin::Application.routes.draw do
  match 'auth/:provider/callback', :controller => :tests, :action => :index

  resources :admins
  resources :subscribers
  resources :concert_series
  resources :concerts

  root :to => 'subscribers#index'
end
