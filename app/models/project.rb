class Project < ActiveRecord::Base
  attr_accessible :body, :title
  belongs_to :user
  
  validates :user_id, :presence => true
  validates :body, :presence => true
  
  default_scope :order => 'projects.created_at DESC'
end
