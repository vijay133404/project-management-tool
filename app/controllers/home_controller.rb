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
        @team = current_user.team
    end
    
    def assign_project_member
        
    end
end
