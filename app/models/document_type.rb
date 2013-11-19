class DocumentType < ActiveRecord::Base
  attr_accessible :name, :platform_id
  
  belongs_to :platform, :foreign_key => 'platform_id'
  has_many :documents, :foreign_key => 'document_type_id'
  
end
