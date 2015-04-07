Rails.application.routes.draw do
  
  devise_for :users, controllers: {registrations: 'users/registrations'}
  
  root 'root#index'

  resources :reports do
  	resources :comments
  end
end
