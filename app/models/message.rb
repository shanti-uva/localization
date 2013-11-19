class Message < ActiveRecord::Base
  attr_accessible :content
  
  has_many :contexts, :foreign_key => 'message_id'
  
end
