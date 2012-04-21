class Thought < ActiveRecord::Base
  attr_accessible :content
  belongs_to :project
  
  validates :content, :presence => true
  
  default_scope :order => 'thoughts.created_at DESC'

end
