class Version < ActiveRecord::Base
  belongs_to :project
  
  validates :name, :presence => true
  
  def to_s
    "Version #{self.name} of #{self.project}"
  end
end
