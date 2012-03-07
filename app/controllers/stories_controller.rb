class StoriesController < ApplicationController
  load_and_authorize_resource
  
  def index
  end
  
  def new
    @project = Project.find(params[:project_id])
  end
  
  def create
  end
  
  def show
  end
end
