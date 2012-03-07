class Project < ActiveRecord::Base
  validates :name, :presence => true,
                   :uniqueness => true
  
  has_many :versions
  has_many :stories
  
  attr_accessible :name, :desc
  
  def to_s
    self.name
  end
end
