class MilestonesController < ApplicationController
  load_and_authorize_resource
  
  def create
    @milestone.version_id = params[:version_id]
    @milestone.save
    
    respond_to do |format|
      format.html do
        flash[:success] = "Created milestone #{@milestone.name}."
        redirect_to version_path(@milestone.version_id)
      end
      format.json { head :ok }
      format.xml  { head :ok }
    end
  end
  
  def index
  end

  def new
  end

  def show
  end
end
