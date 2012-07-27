Hackerjews::Application.routes.draw do
  resources :links, :only => [:index, :new, :create, :edit, :update, :show] do
    resources :comments, :only => [:new, :create]
    resources :votes, :only => [:create]
  end

  resources :comments, :only => [:new, :create] do
    resources :comments, :only => [:new, :create]
    resources :votes, :only => [:create]
  end

  resources :users, :only => [:new, :create]
  resources :sessions, :only => [:new, :create]
  root :to => 'links#index'
end
