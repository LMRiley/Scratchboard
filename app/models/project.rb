class Project < ActiveRecord::Base
  attr_accessible :body, :title
  belongs_to :user
  has_many :thoughts
  
  validates :user_id, :presence => true
  validates :title, :presence => true
  validates :body, :presence => true, :length => {:maximum => 140}
  
  default_scope :order => 'projects.updated_at DESC'
end
