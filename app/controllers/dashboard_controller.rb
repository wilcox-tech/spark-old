class DashboardController < ApplicationController
  def home
    redirect_to '/dashboard/setup_required' if Settings[:ldap_bind_pw] == 'Change this to suit your environment!!!!' and !Settings[:db_auth]
  end
  
  def setup_required
    redirect_to '/' and return if Settings.setup_finished
  end
  
  def setup
    # Don't allow setup to run if it's already been run once.. Talk about wanting to be owned :)
    flash[:error] = "You can't re-run setup." and redirect_to '/' and return if Settings.setup_finished
    
    Settings.org_name = params[:org_name]
    Settings.instance_name = params[:instance_name]
    Settings.db_auth = (params[:db_auth] == 'true')
    
    begin
      if Settings.db_auth
        admin = Member.new(:display_as => params[:admin_fullname], :password => params[:admin_password], :password_confirmation => params[:admin_password])
        admin.login = params[:admin_login]
        admin.save!
        admin.settings.permissions = [{:action => :manage, :class => 'all'}]
        Settings.setup_finished = true
        flash[:success] = "Added administrator #{admin}.  You may now log in."
      else
        Settings.ldap_servers = params[:ldap_servers].split(',')
        Settings.ldap_base = params[:ldap_base]
        Settings.ldap_ssl = (params[:ldap_ssl] == '1')
        Settings.ldap_bind_dn = params[:ldap_bind_dn]
        Settings.ldap_bind_pw = params[:ldap_bind_password]
        Settings.ldap_uid_attr = params[:ldap_uid_attr] unless params[:ldap_uid_attr].empty?
        
        admin = Member.new(:display_as => ldap_user_attrs(params[:ldap_admin]).cn.first)
        admin.login = params[:ldap_admin]
        admin.save!
        admin.settings.permissions = [{:action => :manage, :class => 'all'}]
        Settings.setup_finished = true
        flash[:success] = "LDAP authentication has been set up successfully, and #{admin} is an administrator.  You may now log in."
      end
    rescue
      flash.now[:error] = $!.message
      render 'setup_required' and return
    end
    
    redirect_to '/'
  end
  
  def about
  end
end
