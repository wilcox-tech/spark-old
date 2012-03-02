class Member < ActiveRecord::Base
  include RailsSettings::Extend
  
  validates :login, :presence => true
  
  before_save :create_perma_token
  
  def to_s
    "#{self.display_as} (#{self.login})"
  end
  
  private
    def create_perma_token
      self.perma_token = SecureRandom.base64
    end
end
