class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  before_action :set_project, only: [:show, :edit, :update, :destroy,:create,:index]
 
  def index
    @tasks = Task.all
  end

  def show
  end

 
  def new
    @task = Task.new
  end

 
  def edit
  end

  def create

    @task = @project.tasks.new(task_params)
      if @task.save
         redirect_to project_path(@project), notice: 'Task was successfully created.'
      else
         render :new 
      end
  end

  def update

         @task.update(task_params)
         redirect_to project_path(@project), notice: 'Task was successfully updated.' 
  end


  def destroy
    @task.destroy
      redirect_to project_path(@project), notice: 'Task was successfully destroyed.'
  end

  private
   
    def set_task
      @task = Task.find(params[:id])
    end
    def set_project
      @project = Project.find(params[:project_id])
    end
   
    def task_params
      params.require(:task).permit(:name,:project_id)
    end
end
