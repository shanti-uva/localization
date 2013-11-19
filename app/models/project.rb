class Project < ActiveRecord::Base
  attr_accessible :name
  
   has_many :documents, :foreign_key => 'project_id'
end
