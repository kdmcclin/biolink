include GeographyHelper

Rails.application.routes.draw do
  
  devise_for :users, controllers: {registrations: 'users/registrations'}
  
  root 'root#index'

  resources :reports do
  	resources :comments
  end

  us_states.each do |array|
  	state = array.first
  	get "/#{state.downcase}" => "reports##{state.downcase}"
  end
end
