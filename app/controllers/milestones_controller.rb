class MilestonesController < ApplicationController
  before_action :set_milestone, only: [:show, :edit, :update, :destroy]
  before_action :set_project_with_milstone, only: [:show, :edit, :update, :destroy,:create,:new,:index] 
  
  def index
    @milestones = Milestone.all
  end

  def show
  end

  def new
    @milestone = Milestone.new
  end

  def edit
  end

  def create
      @milestone = @task.milestones.new(milestone_params)
      redirect_to project_task_milestones_path(@project,@task), notice: 'Milestone was successfully created.'
        
  end

  def update
      @milestone.update(milestone_params)
    
      redirect_to project_task_milestones_path(@project,@task), notice: 'Milestone was successfully updated.' 
       
  end

 
  def destroy

       @milestone.destroy
       redirect_to project_task_milestones_path(@project,@task), notice: 'Milestone was successfully destroyed.' 
  end

  private
   
    def set_project_with_milstone
        @task = Task.find(params[:task_id])
        @project = Project.find(params[:project_id])
    end

    def set_milestone
        @milestone = Milestone.find(params[:id])
    end

    
    def milestone_params
        params.require(:milestone).permit(:name, :task_id)
    end
end
