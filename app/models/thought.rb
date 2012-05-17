class Thought < ActiveRecord::Base
  attr_accessible :content, :scratchfile
  belongs_to :project
  has_many :comments
 
  validates         :content, :presence => true
  has_attached_file :scratchfile,
      :storage => :s3,
      :bucket => "Scratchboard",
      :s3_credentials => {
            :access_key_id => "AKIAJMS2TO62W36D7PJQ",
            :secret_access_key => "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"
          },
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
