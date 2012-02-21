Spark::Application.routes.draw do
  get "dashboard/home"
  get "dashboard/about"
  
  resources :sessions, :only => [:new, :create, :destroy]

  root :to => 'dashboard#home'
  
  match '/login' => 'sessions#new'
  match '/logout' => 'sessions#destroy'

  # See how all your routes lay out with "rake routes"
end
