PscAdmin::Application.routes.draw do
  devise_for :admins

  resources :admins

  root :to => 'dashboard#show'
end
