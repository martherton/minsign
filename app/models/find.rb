class Find < ActiveRecord::Base
	

	belongs_to :user


	
	validates :user_id, presence: true
	
	

	def self.search(query)
  	
  	where("searchterm like ?", "%#{query}%") 

	end

end
