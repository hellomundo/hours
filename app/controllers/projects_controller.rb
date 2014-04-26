class ProjectsController < ApplicationController
  before_action :signed_in_user
  
  def index
    @projects = Project.all
  end
  
  def new
    @project = Project.new
  end
  
  def create
    @client = Client.find(params[:client_id])
    @project = @client.projects.build(project_params)
    if(@project.save)
      redirect_to client_path(@client)
    else
      #flash something
      render 'new'
    end
  end
  
  def show
    @project = Project.find(params[:id])
    @efforts = @project.efforts;
  end
  
  def edit
    @project = Project.find(params[:id])
  end
  
  def update
    @project = Project.find(params[:id])
    if(@project.update(project_params))
      redirect_to @project
    else
      #flash something
      render 'edit'
    end
  end

  def toggle_activation
    @project = Project.find(params[:id])
    if(@project.toggle!(:is_active))
      redirect_to projects_path
    else
      #flash something
      redirect_to projects_path
    end
  end
  
  def destroy
    @project = Project.find(params[:id])
    @project.destroy
    
    redirect_to projects_path
  end
  
  private
  
    def project_params
      params.require(:project).permit(:name, :client_id, :start_date, :is_active)
    end
end
