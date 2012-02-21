class Project < ActiveRecord::Base
  validates :name, :presence => true,
                   :uniqueness => true
end
