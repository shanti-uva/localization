class Platform < ActiveRecord::Base
  attr_accessible :name
  
  has_many :document_types, :dependent => :destroy
  
end
