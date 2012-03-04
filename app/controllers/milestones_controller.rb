class MilestonesController < ApplicationController
  load_and_authorize_resource
  
  def create
    @milestone.version_id = params[:version_id]
    @milestone.save
    
    respond_to do |format|
      format.html do
        flash[:success] = "Created milestone #{@milestone}."
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
  
  def complete
    @milestone.completed_on = Date.today
    @milestone.save
    
    respond_to do |format|
      format.html do
        flash[:success] = "Marked #{@milestone} as completed."
        redirect_to version_path(@milestone.version_id)
      end
      format.json { head :ok }
      format.xml  { head :ok }
    end
  end
  
  def edit
  end
  
  def update
    params[:milestone].delete(:version_id)
    update_response_depending_on @milestone.update_attributes(params[:milestone]), @milestone, version_path(@milestone.version_id)
  end
end
