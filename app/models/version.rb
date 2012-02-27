class Version < ActiveRecord::Base
  belongs_to :project
  has_many :milestones
  
  validates :name, :presence => true
  
  def to_s
    "Version #{self.name} of #{self.project}"
  end
end
