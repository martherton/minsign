class Declarative < ActiveRecord::Base
	belongs_to :user
	belongs_to :docstructure
	belongs_to :linkcat
	serialize :urlextra

	has_attached_file :declarativeimage,
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
		

  validates_attachment_content_type :declarativeimage, :content_type => /\Aimage\/.*\Z/
 
  validates :urlsource, presence: true
  validates :declarativejusttext, presence: true, uniqueness: true
  validates :entryhierarchy, presence: true
  validates :texttype, presence: true
  validates :linkcat_id, presence: true
  validates :docstructure_id, presence: true


	acts_as_taggable

	

	protected

	before_save do 
		choptext(declarativejusttext)
		finddata(declarativejusttext)
		createtags(declarativejusttext, linkcat_id, docstructure_id)
		findextraurl(declarativejusttext)
		
	end
		
	def choptext(text)
		text2 = text.remove("#")
		text3 = text2.gsub(/(?:f|ht)tps?:\/[^\s]+/, '')
		self.declarativetext = text3.remove("~")

	end
	
	def finddata(text)
		@text2 = text.split(" ")
		t = 0
		@text2.each do |text2|
			if text2.first == "~"
				self.datapoint = text2.remove("~")
				t = 1
			elsif t == 1
				self.units = text2
				t = 0
			end
		end		
	end

	def findextraurl(text)
		
		
		self.urlextra = text.split.grep(/(?:f|ht)tps?:\/[^\s]+/)
		
	end	

	def createtags(text, idl, idd)
		self.tag_list = ""
		@text2 = text.split(" ")
		t = 0
		@text2.each do |text2|
			if text2.first == "#"
				@text3 = text2.remove("#")
				self.tag_list = [self.tag_list,@text3].join(',')
			else
			end
		end	
		@lname = Linkcat.find(idl)
		@dname = Docstructure.find(idd)
		@lnametag = @lname.linkcatname
		@dnametag = @dname.headingname
		self.tag_list	= [self.tag_list,@lnametag,@dnametag].join(',')
	end	

	
	
  
   

	def self.search(query)
  	
  	where("declarativetext like ?","%#{query}%") 

	end

	def dec_allowed

	end	



end
