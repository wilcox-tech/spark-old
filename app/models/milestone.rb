class Milestone < ActiveRecord::Base
  belongs_to :version
  
  validates :version_id, :presence => true
  validates :name, :presence => true
  validates :due_by, :presence => true

  has_many :due_stories, :class_name => 'Story', :foreign_key => 'due_in', :inverse_of => :completed_stories
  has_many :completed_stories, :class_name => 'Story', :foreign_key => 'completed_in', :inverse_of => :due_stories
  
  attr_accessible :name, :description, :due_by, :completed_on
  
  def to_s
    "Milestone #{self.name}"
  end
end

