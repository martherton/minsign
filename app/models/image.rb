class Image < ActiveRecord::Base
	has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png",
		:url => "/Information_images/:hash.:extension",
		:hash_secret => "longSecretString",
		:path =>"/Information_images/:hash.:extension",
		:storage => :s3,
		:s3_host_name => 's3-eu-west-1.amazonaws.com',
		:s3_credentials => {
		  :bucket => ENV['S3_BUCKET_NAME'],
		  :access_key_id => ENV['AWS_ACCESS_KEY_ID'],
		  :secret_access_key => ENV['AWS_SECRET_ACCESS_KEY']
        }
	validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
	belongs_to :draft
end
