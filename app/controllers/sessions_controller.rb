class SessionsController < ApplicationController
  def new
  end
  
  def create
    uid = params[:session][:username]
    if Settings.db_auth
      member = Member.find_by_login(uid)
      if member and member.authenticate(params[:session][:password])
        member.save!
        log_in member
        redirect_to '/'
      else
        flash.now[:error] = 'Invalid credentials'
        render 'new'
      end
      return
    end
      
    if ldap_login(uid, params[:session][:password])
      member = Member.find_by_login(uid)
      member ||= Member.new(:display_as => ldap_user_attrs(uid).cn.first)
      member.login = uid
      member.password_digest = "LDAP"
      raise "member is false" if member. == false
      member.save!
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
