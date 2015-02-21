class Find < ActiveRecord::Base
	

	belongs_to :user

	acts_as_taggable
	
	validates :user_id, presence: true
	
	
  

   private

	def self.search(query) #remember lib/extended/tag_extend.rb (ilikes are here, in declaratives.rb and tag_extend)
  	
  	where("searchterm ilike ?", "%#{query}%") 

	end

	protected

	before_create do
		self.tag_list = self.tag_list_tokens
	end
	

end
