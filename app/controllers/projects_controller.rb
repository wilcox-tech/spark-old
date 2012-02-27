class ProjectsController < ApplicationController
  load_and_authorize_resource
  
  def index
    respond_to do |format|
      format.html   # render directly to HTML from erb template
      format.json { render :json => @projects }
      format.xml    # render direction to XML from builder template
    end
  end
  
  def new
  end
  
  def create
    @project.versions.build(params[:version]) if !params[:version][:name].nil?
    @project.save
    
    respond_to do |format|
      format.html do
        flash[:success] = "Created project #{@project.name}."
        redirect_to @project
      end
      format.json { head :ok }
      format.xml  { head :ok }
    end
  end
  
  def edit
  end
  
  def update
    respond_to do |format|
      if @project.update_attributes(params[:project])
        format.html do
          flash[:success] = "Project updated successfully."
          redirect_to @project
        end
        format.json { head :ok }
        format.xml  { head :ok }
      else
        format.html do
          nice_errors = @project.errors.full_messages.collect {|err| "<li>" + err + "</li>"}
          flash[:error] = "<ul>#{nice_errors}</ul>".html_safe
          render :action => "edit"
        end
        format.json { render :json => @project.errors, :status => :unprocessable_entity }
        format.xml  { render "error", :formats => [:xml],
                      :locals => { :class => "params", :error => @project.errors.full_messages },
                      :status => :unprocessable_entity }
      end
    end
  end
  
  def show
    respond_to do |format|
      format.html
      format.xml
      format.json { render :json => @project, :include => [:versions] }
    end
  end
  
  def destroy
    @project.destroy
    
    respond_to do |format|
      format.html do
        flash[:success] = "Project removed."
        redirect_to projects_url
      end
      format.json { head :ok }
      format.xml  { head :ok }
    end
  end
end
