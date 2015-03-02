Rails.application.routes.draw do
  
  root 'shallows#home'
  
  resources :codes

  devise_for :users

  resources :charges, only: [:new, :create]

end
