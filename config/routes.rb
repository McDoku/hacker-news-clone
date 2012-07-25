Hackerjews::Application.routes.draw do
  resources :links, :only => [:index, :new, :create, :edit, :update]
  resources :users, :only => [:new, :create]
  resources :sessions, :only => [:new, :create]
  resources :votes, :only => :create
  root :to => 'links#index'
end
