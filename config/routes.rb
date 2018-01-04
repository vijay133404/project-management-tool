Rails.application.routes.draw do

  resources :technologies
  resources :clients
  devise_for :users 
  resources :dependencies
  resources :projects do
    	resources :tasks do
        		resources :dependencies
            resources :milestones
    	 end
    end
  resources :teams do
    member do
      get 'add_member'
      post'submit_member'
    end
  end

  root to:  'home#index'
  # get 'add/member', :to => 'home#addmember_form'
  # post 'submit/member', :to => 'home#add_member_to_team'
  get 'team/members', :to => 'home#team_and_members'
  get 'assign/project/team', :to => 'home#assign_project_team_form'
  post 'submit/project/team', :to => 'home#submit_project_to_team'
  get 'all_team_project', :to => 'home#all_team_project'
  get 'team/:id/member', :to => 'home#assign_project_member_form', as:'team/member'
  post 'submit/project/team/member',:to=>'home#assign_project_member'
  get'all_member/assign/project',:to=>'home#all_member_assign_project'
  #post 'submit/project/team/member/task',:to=>'home#assign_project_member_task'
  post 'submit/project/:project_id/team/:team_id/member/:member_id/task',:to=>'home#assign_project_member_task',as:"member/task/assign"
  get 'all_team/member_task',:to=>'home#all_project_member_task'
end
