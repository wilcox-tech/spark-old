class Version < ActiveRecord::Base
  belongs_to :project
  has_many :milestones
  
  attr_accessible :name, :codename, :target_release_date, :actual_release_date
  
  validates :name, :presence => true
  
  def to_s
    return "Version #{self.name}" if self.codename.empty?
    "#{self.codename} (#{self.name})"
  end
end
