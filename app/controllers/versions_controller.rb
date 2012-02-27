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
      format.xml  { head :ok}
    end
  end
  
  def show
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
