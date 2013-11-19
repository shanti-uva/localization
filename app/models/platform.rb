class Platform < ActiveRecord::Base
  attr_accessible :name
  
  has_many :document_types, :foreign_key => 'platform_id'
  
end
