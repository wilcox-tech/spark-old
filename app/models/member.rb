class Member < ActiveRecord::Base
  include RailsSettings::Extend
  
  has_secure_password
  validates :login, :presence => true, :uniqueness => true
  validates :password, :on => :create, :length => { :minimum => 8 }, :if => Proc.new { Settings.db_auth }
  validates_presence_of :password_digest, :if => Proc.new { Settings.db_auth }
  
  attr_accessible :display_as, :password, :password_confirmation
  
  before_save :create_perma_token
  
  def to_s
    "#{self.display_as} (#{self.login})"
  end
  
  private
    def create_perma_token
      self.perma_token = SecureRandom.base64
    end
end
