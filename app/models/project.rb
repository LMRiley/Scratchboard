class Project < ActiveRecord::Base
  attr_accessible :title, :body, :brief
  has_many :ownerships
  has_many :users, through: :ownerships
  has_many :thoughts
  has_many :stories
  
  validates :title, :presence => true
  validates :body, :presence => true, :length => {:maximum => 140}
  
  default_scope :order => 'projects.updated_at DESC'
end
