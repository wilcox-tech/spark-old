class SessionsController < ApplicationController
  def new
  end
  
  def create
    uid = params[:session][:username]
    if ldap_login(uid, params[:session][:password])
      member = Member.find_by_login(uid)
      member ||= Member.new(:login => uid,
                            :display_as => ldap_user_attrs(uid).cn.first).save
      log_in member
      redirect_to '/'
    else
      flash.now[:error] = 'Invalid credentials.'
      render 'new'
    end
  end
  
  def destroy
  end
end
