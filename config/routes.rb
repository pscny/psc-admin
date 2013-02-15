PscAdmin::Application.routes.draw do
  devise_for :admins

  resources :admins
  resources :subscribers
  resources :concert_series
  resources :concerts

  root :to => 'subscribers#index'
end
