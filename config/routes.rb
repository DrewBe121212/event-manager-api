Rails.application.routes.draw do

  resource :session, only: [:show, :create, :destroy]
  resources :menus, :users 

end
