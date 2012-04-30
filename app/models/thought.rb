class Thought < ActiveRecord::Base
  attr_accessible :content, :scratchfile
  belongs_to :project
  
  validates         :content, :presence => true
  has_attached_file :scratchfile, 
    :styles => lambda{ |a| 
    ["image/jpeg", "image/png", "image/jpg", "image/gif"].include?( a.content_type ) ? {
      :thumb=> "100x100#",
      :small  => "150x150>",
      :medium => "300x300>",
      :large =>   "500x500>" }: {}
    },
      :storage => :s3,
      :s3_credentials => S3_CREDENTIALS
     
  default_scope :order => 'thoughts.created_at DESC'

end
