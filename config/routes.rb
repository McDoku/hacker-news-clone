Hackerjews::Application.routes.draw do
  resources :links, :only => [:index, :new, :create]
  resources :users, :only => [:new, :create]
  resources :sessions, :only => [:new, :create]
  root :to => 'links#index'
end
