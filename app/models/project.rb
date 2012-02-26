class Project < ActiveRecord::Base
  validates :name, :presence => true,
                   :uniqueness => true
  
  has_many :versions
  
  def to_s
    self.name
  end
end
