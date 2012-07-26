Hackerjews::Application.routes.draw do
  resources :links, :only => [:index, :new, :create, :edit, :update, :show] do
    resources :comments, :only => [:index, :new, :create]
  end

  resources :comments, :only => [:index, :new, :create] do
    resources :comments, :only => [:index, :new, :create]
  end

  resources :users, :only => [:new, :create]
  resources :sessions, :only => [:new, :create]
  resources :votes, :only => :create
  root :to => 'links#index'
end
