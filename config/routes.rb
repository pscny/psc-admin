PscAdmin::Application.routes.draw do
  match 'sign_in',  :controller => :sessions, :action => :new,     :as => :sign_in
  match 'sign_out', :controller => :sessions, :action => :destroy, :as => :sign_out

  resources :sessions, :only => [ :create ]

  root :to => 'dashboard#show'
end
