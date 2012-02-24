class ApplicationController < ActionController::Base
  protect_from_forgery
  include SessionsHelper
  
  access_messages = ["That's not your piece!", "I'm sorry, Dave, I'm afraid I can't let you do that.",
                     "Shame, such a shame, I think you kinda clicked something you shouldn't've.",
                     "You can't touch this."]
  
  rescue_from CanCan::AccessDenied do |exception|
    flash[:error] = access_messages.sample
    redirect_to login_path and return if !logged_in?
    redirect_to root_path
  end
end
