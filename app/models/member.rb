class Member < ActiveRecord::Base
  include RailsSettings::Extend
  
  validates :login, :presence => true
  
  before_save :create_perma_token
  
  private
    def create_perma_token
      self.perma_token = SecureRandom.base64
    end
end
