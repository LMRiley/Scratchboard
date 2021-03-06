class Thought < ActiveRecord::Base
  attr_accessible :content, :scratchfile
  belongs_to :project
  belongs_to :user
  has_many :comments
  
  validates :content, :presence => true
 
  has_attached_file :scratchfile,
      :path => ":rails_root/public/system/:attachment/:id/:style/:filename",
      :url => "/system/:attachment/:id/:style/:filename",
      :storage => :s3,
      :bucket => "Scratchboard",
      :s3_credentials => S3_CREDENTIALS,
      :styles => lambda{ |a|
      ["image/jpeg", "image/png", "image/jpg", "image/gif"].include?( a.content_type ) ? {
        :thumb  => "100x100",
        :small  => "200x200",
        :medium => "400x400",
        :large  => "1000x1000" }: {}
      }
    
  default_scope :order => 'thoughts.created_at DESC'
 
  def has_thumbnail?
    ["image/jpeg", "image/png", "image/jpeg", "image/gif"].include?(scratchfile.content_type)
  end

end
