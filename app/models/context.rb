class Context < ActiveRecord::Base
  attr_accessible :document_id, :key, :message_id
  
  belongs_to :document, :foreign_key => 'document_id'
  belongs_to :message, :foreign_key => 'message_id'
  #has_many :translations, :dependent => :destroy
  has_many :translations, :as => :translated
end
