Hackerjews::Application.routes.draw do
  resources :links, :only => [:index, :new, :create, :edit, :update] do
    resources :comments, :only => [:index, :new, :create]
  end
  resources :users, :only => [:new, :create]
  resources :sessions, :only => [:new, :create]
  root :to => 'links#index'
end
