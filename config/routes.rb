Rails.application.routes.draw do
  
  resources :teams
  resources :dependencies
  resources :projects do
  	resources :tasks do
  		resources :dependencies
  	 end
    end
  root to:  'home#index'
  get 'add/member', :to => 'home#addmember_form'
  
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
