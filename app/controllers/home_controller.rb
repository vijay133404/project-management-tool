class HomeController < ApplicationController

  def index
       
  end
  
  def addmember_form
      @teams = Team.all 
      @users =  User.all
  end

  def add_member_to_team
    if params[:member].present?
    User.find(params[:member]).update(team_id: params[:team_member][:team_id])
  end
    @teams  = Team.all
  end
     
    def team_and_members
      @teams  = Team.all
    end

    def assign_project_team_form
     @projects = Project.all
     @teams  = Team.all
    end

    def submit_project_to_team
       ProjectTeam.create(project_id: params[:assign_team_project][:project_id],team_id: params[:team])
       @teams  = Team.all

    end

    def all_team_project
       @teams  = Team.all
    end
    
    def assign_project_member_form
      
         @team =Team.find(params[:id])
    end
    
    def assign_project_member

        @project_user = ProjectUser.create(user_id: params[:member],project_id:params[:project])
        
        @team = @project_user.user.team
        @user = @project_user.user
        @project = @project_user.project
    end

    def all_member_assign_project
       
    end
    
    def assign_project_member_task
       
       @task = TaskMember.create(team_id: params[:team],project_id: params[:project],user_id: params[:user],task_id:params[:project_task_team_member][:task_id])
       
    end

    def all_project_member_task
        
    end
end
