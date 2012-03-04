class Project < ActiveRecord::Base
  validates :name, :presence => true,
                   :uniqueness => true
  
  has_many :versions
  
  attr_accessible :name, :desc
  
  def to_s
    self.name
  end
end
