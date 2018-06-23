Rails.application.routes.draw do

  resource :session, only: [:show, :create, :destroy]
  resources :users 

  resources :menus do
    collection do
      get :user
    end
  end
end
