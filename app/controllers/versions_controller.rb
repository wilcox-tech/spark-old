class VersionsController < ApplicationController
  load_and_authorize_resource
  
  def new
    @project = Project.find(params[:project_id])
  end
  
  def create
    @project = Project.find(params[:project_id])
    @version.save!
    
    respond_to do |format|
      format.html do
        flash[:success] = "Added version #{@version.name}."
        redirect_to @project
      end
      format.json { head :ok }
      format.xml  { head :ok }
    end
  end
  
  def edit
  end
  
  def show
  end
  
  def update
    params[:version].delete(:project_id)
    update_response_depending_on @version.update_attributes(params[:version]), @version
  end
  
  def destroy
    @project = @version.project
    @version.destroy
    
    respond_to do |format|
      format.html do
        flash[:success] = "Version removed."
        redirect_to @project
      end
      format.json { head :ok }
      format.xml  { head :ok }
    end
  end
end
