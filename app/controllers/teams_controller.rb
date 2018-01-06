class TeamsController < ApplicationController
  before_action :set_team, only: [:show, :edit, :update, :destroy,:submit_project_member,:project_member_task]

  def index
    @teams = Team.all
  end

 
  def show
  end

 
  def new
    @team = Team.new
  end

 
  def edit
  end

  
  def create
    @team = Team.new(team_params)

    respond_to do |format|
      if @team.save
        format.html { redirect_to @team, notice: 'Team was successfully created.' }
        format.json { render :show, status: :created, location: @team }
      else
        format.html { render :new }
        format.json { render json: @team.errors, status: :unprocessable_entity }
      end
    end
  end


  def update
    respond_to do |format|
      if @team.update(team_params)
        format.html { redirect_to @team, notice: 'Team was successfully updated.' }
        format.json { render :show, status: :ok, location: @team }
      else
        format.html { render :edit }
        format.json { render json: @team.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @team.destroy
    respond_to do |format|
      format.html { redirect_to teams_url, notice: 'Team was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  def add_member_team
      @teams = Team.all 
      @users =  User.all
  end

  def submit_member
    if params[:team_member][:user_id].present?
    User.find(params[:team_member][:user_id]).update(team_id: params[:team_member][:team_id])
   end
    @teams  = Team.all
    redirect_to team_path(params[:team_member][:team_id])
  end
  
  def assign_project_team
    @projects = Project.all

  end

  def submit_project
    ProjectTeam.create(project_id: params[:project],team_id:params[:assign_project][:team_id])
    redirect_to team_path(params[:assign_project][:team_id])

  end

   def assign_project_member
     @team = Team.find(params[:id])
   end

  def submit_project_member
    
        @user = User.find(params[:member])
        @project = Project.find(params[:project])
        @team = @user.team
        if ProjectUser.where(user_id: params[:member],project_id:params[:project]).first.present?
              flash[:notice]= 'alredy assign project to member'
        else
            @project_user = ProjectUser.create(user_id: params[:member],project_id:params[:project])
        end
      
  end
  
   def project_member_task
     
      @task = TaskMember.create(task_id: params[:project_member_task][:task_id],user_id: params[:member_id],project_id: params[:project_id],team_id:params[:id])
      redirect_to team_path(@team) 
   end
  
   def user_projects
     @user = User.find(params[:user_id])
     @projects = @user.projects
    end

  private
   
    def set_team
      @team = Team.find(params[:id])
    end

   
    def team_params
      params.require(:team).permit(:name)
    end

end
