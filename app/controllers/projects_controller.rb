class ProjectsController < ApplicationController
  def index
    @projects = Project.accepting_pledges
  end

  def show
    @project = Project.find(params[:id])
  end

  def edit
    @project = Project.find(params[:id])
  end

  def update
    @project = Project.find(params[:id])
    if @project.update(project_params)
      redirect_to @project, notice:'Project successfully updated!'
    else
      render :edit
    end
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    if @project.save
      redirect_to @project, notice:'Project successfully created!'
    else
      render :new
    end
  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy
    redirect_to projects_url, alert:'Project successfully deleted!'

    #redirect_to projects_url, danger:'DANGER! ABANDON ALL HOPE, YE WHO ENTER HERE!'

  end

private

  def project_params
    params.require(:project).permit(:name, :description, :pledging_ends_on, :target_pledge_amount, :website, :team_members, :image_file_name)
  end
end
