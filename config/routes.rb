Rails.application.routes.draw do

  resource :session, :only => [:show, :create, :destroy] do
    member do
      post :create_sso
    end
  end
  resources :menus, :only => [:index]
  
end