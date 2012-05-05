class Project < ActiveRecord::Base
  attr_accessible :title, :body, :brief
  belongs_to :user
  has_many :thoughts
  has_many :stories
  
  validates :user_id, :presence => true
  validates :title, :presence => true
  validates :body, :presence => true, :length => {:maximum => 140}
  
  default_scope :order => 'projects.updated_at DESC'
end
