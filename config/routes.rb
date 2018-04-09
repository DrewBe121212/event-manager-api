Rails.application.routes.draw do

  resource :sessions, only: [:create, :destroy]

  resources :users 

end
