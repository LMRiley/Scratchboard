if Rails.env == "development"
  #S3_CREDENTIALS = Rails.root.join("config/s3.yml")
  S3_CREDENTIALS = { :access_key_id => ENV['S3_KEY'], :secret_access_key => ENV['S3_SECRET'] }
else
  S3_CREDENTIALS = { :access_key_id => ENV['S3_KEY'], :secret_access_key => ENV['S3_SECRET'] }
end