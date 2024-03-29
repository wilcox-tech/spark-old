Spark::Application.routes.draw do
  get "dashboard/home"
  get "dashboard/about"
  get "dashboard/setup_required"
  put "dashboard/setup"
  
  resources :sessions, :only => [:new, :create, :destroy]
  
  resources :projects do
    resources :versions, :only => [:new, :create]
  end
  
  resources :versions, :only => [:edit, :update, :show, :destroy] do
    resources :milestones do
      put 'complete', :on => :member
    end
  end

  root :to => 'dashboard#home'
  
  match '/login' => 'sessions#new'
  match '/logout' => 'sessions#destroy'
  match '/p' => redirect("/projects")
  match '/p/:id' => redirect("/projects/%{id}")

  # See how all your routes lay out with "rake routes"
end
