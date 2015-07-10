class ProjectsController < ApplicationController
  load_and_authorize_resource


  def show
    @skill = Skill.find(params[:skill_id])
    @project = @skill.projects.find(params[:id])
  end


  def new
    @skill = Skill.find(params[:skill_id])
    @project = @skill.projects.new
  end

  def create
    @skill = Skill.find(params[:skill_id])
    @project = @skill.projects.new(project_params)
    if @project.save
      flash[:notice] = "Project saved"
      redirect_to skill_path(@skill)
    else
      render :new
    end
  end

  def edit
    @skill = Skill.find(params[:skill_id])
    @project = @skill.projects.find(params[:id])
    render :edit
  end

  def update
    @skill = Skill.find(params[:skill_id])
    @project = Project.find(params[:id])

    if @project.update(project_params)
      flash[:notice]= "Updated"
      redirect_to skill_project_path(@skill, @project)
    else
      render :edit
    end
  end

  def destroy
    @skill = Skill.find(params[:skill_id])
    @project = Project.find(params[:id])
    @project.destroy
    redirect_to skill_path(@skill)
  end

private
  def project_params
    params.require(:project).permit(:name, :description, :link)
  end
end
