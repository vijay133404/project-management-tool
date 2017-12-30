class DependenciesController < ApplicationController
  before_action :set_dependency, only: [:show, :edit, :update, :destroy]
  before_action :set_project_with_task, only: [:show, :edit, :update, :destroy,:create]   
  
  def index
    @dependencies = Dependency.all
  end

  
  def show
  end

 
  def new
    @dependency = Dependency.new
  end

 
  def edit
  end

 
  def create
    @dependency = @task.dependencies.new(dependency_params)
      @dependency.save
      redirect_to project_path(@project), notice: 'Dependency was successfully created.' 
   
  end

  
  def update
   
       @dependency.update(dependency_params)
        redirect_to project_path(@project), notice: 'Dependency was successfully updated.' 
        
  end

 
  def destroy
    @dependency.destroy
      redirect_to project_path(@project), notice: 'Dependency was successfully destroyed.'
   
  end

  private
   
    def set_dependency
      @dependency = Dependency.find(params[:id])
    end
    
    def set_project_with_task
      @task = Task.find(params[:task_id])
      @project = Project.find(params[:project_id])
    end
   
    def dependency_params
      params.require(:dependency).permit(:name)
    end
end
