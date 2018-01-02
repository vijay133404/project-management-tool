class MilestonesController < ApplicationController
  before_action :set_milestone, only: [:show, :edit, :update, :destroy]
  before_action :set_project_with_milstone, only: [:show, :edit, :update, :destroy,:create] 
  # GET /milestones
  # GET /milestones.json
  def index
    @milestones = Milestone.all
  end

  # GET /milestones/1
  # GET /milestones/1.json
  def show
  end

  # GET /milestones/new
  def new
    @milestone = Milestone.new
  end

  # GET /milestones/1/edit
  def edit
  end

  # POST /milestones
  # POST /milestones.json
  def create
    @milestone = @task.milestones.new(milestone_params)
    respond_to do |format|
      if @milestone.save
        format.html { redirect_to project_path(@project), notice: 'Milestone was successfully created.' }
        format.json { render :show, status: :created, location: @milestone }
      else
        format.html { render :new }
        format.json { render json: @milestone.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /milestones/1
  # PATCH/PUT /milestones/1.json
  def update
    respond_to do |format|
      if @milestone.update(milestone_params)
        format.html { redirect_to project_path(@project), notice: 'Milestone was successfully updated.' }
        format.json { render :show, status: :ok, location: @milestone }
      else
        format.html { render :edit }
        format.json { render json: @milestone.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /milestones/1
  # DELETE /milestones/1.json
  def destroy
    @milestone.destroy
    respond_to do |format|
      format.html { redirect_to project_path(@project), notice: 'Milestone was successfully destroyed.' }
      format.json { head :no_content }
    end
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
