class Story < ActiveRecord::Base
  has_many :comments, :as => :commentable
  belongs_to :project

  belongs_to :due_in, :class_name => 'Milestone'
  belongs_to :completed_in, :class_name => 'Milestone'
  
  validates :name, :presence => true
  validates :created_by, :presence => true
  
  attr_accessible :name, :description, :preconditions, :postconditions, :normal_flow, :alternative_flows, :exceptions, :priority
  
  serialize :preconditions
  serialize :postconditions
  serialize :normal_flow
  serialize :alternative_flows
  serialize :exceptions
end
