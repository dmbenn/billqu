Rails.application.routes.draw do
  
  root 'shallows#home'
  
  resources :codes do
    member do
      delete 'remove_editor'
      post 'add_editor'
    end
  end

  devise_for :users
  
  resources :users, only: [:update]
   
  resources :charges, only: [:new, :create]

end
