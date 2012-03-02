class Milestone < ActiveRecord::Base
  belongs_to :version
  
  validates :version_id, :presence => true
  validates :name, :presence => true
  validates :due_by, :presence => true
  
  def to_s
    "Milestone #{self.name}"
  end
end
