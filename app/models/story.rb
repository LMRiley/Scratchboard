class Story < ActiveRecord::Base
  attr_accessible :content, :points, :user_id, :status, :type
  belongs_to :project
  
  default_scope :order => 'stories.created_at DESC'
  
  validates :project_id, :presence => true
  validates :content, :presence => true
end
