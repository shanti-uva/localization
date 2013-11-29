class Translation < ActiveRecord::Base
  attr_accessible :content, :context_id, :language_id, :message_id
  
  #belongs_to :context, :foreign_key => 'context_id'
  belongs_to :translated, :polymorphic => true
  belongs_to :language, :class_name => 'ComplexScripts::Language'
end
