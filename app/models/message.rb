class Message < ActiveRecord::Base
  attr_accessible :content
  
  has_many :contexts, :dependent => :destroy
  has_many :translations, :as => :translated
end
