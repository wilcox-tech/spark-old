class ProjectsController < ApplicationController
  load_and_authorize_resource
  
  def index
  end
  
  def new
  end
  
  def create
    @project.versions.build(params[:version]) if !params[:version][:name].nil?
    @project.save
    redirect_to @project
  end
  
  def show
  end
end
