Rails.application.routes.draw do
  devise_for :users
  resources :teams
  resources :dependencies
  resources :projects do
  	resources :tasks do
  		resources :dependencies
  	 end
    end
  root to:  'home#index'
  get 'add/member', :to => 'home#addmember_form'
  post 'submit/member', :to => 'home#add_member_to_team'
  get 'team/members', :to => 'home#team_and_members'
  get 'assign/project/team', :to => 'home#assign_project_team_form'
  post 'submit/project/team', :to => 'home#submit_project_to_team'
  get 'all_team_project', :to => 'home#all_team_project'
  get 'assign_project_member_form', :to => 'home#assign_project_member_form'
  post 'assign_project_member',:to=>'home#assign_project_member'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
