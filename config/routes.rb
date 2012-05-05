PmApp31::Application.routes.draw do
  get "sessions/new"

  resources :users, :only => [:new, :create, :show, :edit, :update]
  resources :sessions, :only => [:new, :create, :destroy]
  resources :projects do 
    resources :thoughts
    resources :stories
  end
  
  match '/getstarted',     :to => 'users#new'
  match '/signin',         :to => 'sessions#new'
  match '/signout',        :to => 'sessions#destroy'      
  match '/about',          :to => 'pages#about'
  
  root :to => 'pages#home'
  
end
