class Find < ActiveRecord::Base
	
	belongs_to :linkcat
	belongs_to :user

	validates :searchterm, presence: true
	validates :user_id, presence: true
	validates :linkcat_id, presence: true
	

	def self.search(query)
  	
  	where("searchterm like ?", "%#{query}%") 

	end

end
