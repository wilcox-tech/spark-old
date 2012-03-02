class DashboardController < ApplicationController
  def home
    redirect_to '/dashboard/setup_required' if Settings[:ldap_bind_pw] == 'Change this to suit your environment!!!!'
  end
  
  def setup_required
  end

  def about
  end
end
