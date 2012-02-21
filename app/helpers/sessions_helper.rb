require 'net/ldap'

module SessionsHelper
  def log_in(member)
    cookies.permanent[:spark_lightning] = member.perma_token
    current_user = member
  end
  
  def logged_in?
    !current_user.nil?
  end
  
  def current_user=(user)
    @current_user = user
  end
  
  def current_user
    @current_user ||= find_member_by_session
  end
  
  def ldap_gen
    ldap = Net::LDAP.new
    if Settings.ldap_ssl
      ldap.encryption :simple_tls
      ldap.port = 636
    end
    ldap.host = Settings.ldap_servers.sample
    ldap
  end
  
  def ldap_user_attrs(uid)
    ldap = ldap_gen
    ldap.auth Settings.ldap_bind_dn, Settings.ldap_bind_pw
    return nil unless ldap.bind
    filter = Net::LDAP::Filter.eq(Settings.ldap_uid_attr,uid)
    attrs = ['cn','dn']
    ldap.search(:base => Settings.ldap_base, :filter => filter, :attributes => attrs, :return_result => true)[0]
  end
  
  def ldap_login(user, pass)
    user = ldap_user_attrs(user)
    return false unless user
    ldap = ldap_gen
    ldap.auth user.dn, pass
    ldap.bind
  end
  
  private
    def find_member_by_session
      perma_token = cookies[:spark_lightning]
      Member.find_by_perma_token(perma_token) unless perma_token.nil?
    end
end
