class Comment < ActiveRecord::Base
  attr_accessible :content, :user
  belongs_to :thought
  
  validates :content, :presence => true
  validates :thought_id, :presence => true
  
  default_scope :order => 'comments.created_at DESC'
end
