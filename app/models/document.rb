class Document < ActiveRecord::Base
  attr_accessible :document_type_id, :project_id
  
  belongs_to :document_type, :foreign_key => 'document_type_id'
  belongs_to :project, :foreign_key => 'project_id'
  has_many :contexts, :foreign_key => 'document_id'
  
end
