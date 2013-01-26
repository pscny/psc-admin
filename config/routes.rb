PscAdmin::Application.routes.draw do
  devise_for :admins

  resources :admins
  resources :subscribers

  root :to => 'subscribers#index'
end
