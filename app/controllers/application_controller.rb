class ApplicationController < ActionController::Base
  protect_from_forgery
  include SessionsHelper
  
  access_messages = ["That's not your piece!", "I'm sorry, Dave, I'm afraid I can't let you do that.",
                     "Shame, such a shame, I think you kinda clicked something you shouldn't've.",
                     "You can't touch this."]
  
  rescue_from CanCan::AccessDenied do |exception|
    api_error = {:error_class => "login", :error => "Invalid credentials specified."}
    render "error", :formats => [:xml], :locals => api_error and return if request.format == :xml
    render :json => api_error and return if request.format == :json
    flash[:error] = access_messages.sample
    redirect_to login_path and return if !logged_in?
    redirect_to root_path
  end
  
  def update_response_depending_on(success, model)
    respond_to do |format|
      if success
        format.html do
          flash[:success] = "#{model} has been updated successfully."
          redirect_to model
        end
        format.json { head :ok }
        format.xml  { head :ok }
      else
        format.html do
          nice_errors = model.errors.full_messages.collect {|err| "<li>" + err + "</li>"}
          flash[:error] = "<ul>#{nice_errors}</ul>".html_safe
          render :action => "edit"
        end
        format.json { render :json => model.errors, :status => :unprocessable_entity }
        format.xml  { render "error", :formats => [:xml],
                      :locals => { :class => "params", :error => model.errors.full_messages },
                      :status => :unprocessable_entity }
      end
    end
  end
end
