class Ability
  include CanCan::Ability

  def initialize(user)
    # Global permissions (default = nil)
    add_permissions_from Settings.permissions unless Settings.permissions.nil?
    
    # Authed user permissions (default = nil)
    add_permissions_from Settings.authed_permissions unless user.nil?
    
    # User permissions (default = nil)
    add_permissions_from user.settings.permissions unless user.nil?
  end
  
  private
    def add_permissions_from(permissions)
      return if permissions.nil?
      permissions.each do |permission|
        if permission[:subjects].nil?
          can permission[:action].to_sym, permission[:class].constantize
        else
          can permission[:action].to_sym, permission[:class].constantize, :id => permission.subjects
        end
      end
    end
end
