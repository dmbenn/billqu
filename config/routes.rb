Rails.application.routes.draw do
  
  root 'shallows#home'
  
  resources :codes

  devise_for :users
  
  resources :users, only: [:update]
   

  resources :charges, only: [:new, :create]

end
