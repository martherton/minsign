class Draft < ActiveRecord::Base
	belongs_to :user
	has_many :images
	has_many :declaratives
	has_many :docstructures
	has_one :book
	has_one :brainstorm
	has_one :lecture
	has_one :meeting
	has_one :otherpublication
	has_one :webpage

	accepts_nested_attributes_for :images, :allow_destroy => true
	accepts_nested_attributes_for :book, :allow_destroy => true
	accepts_nested_attributes_for :brainstorm, :allow_destroy => true
	accepts_nested_attributes_for :lecture, :allow_destroy => true
	accepts_nested_attributes_for :meeting, :allow_destroy => true
	accepts_nested_attributes_for :otherpublication, :allow_destroy => true
	accepts_nested_attributes_for :webpage, :allow_destroy => true
	acts_as_taggable

	private

	def self.search(query) #remember lib/extended/tag_extend.rb (ilikes are here, in declaratives.rb and tag_extend)
  	
  	where("searchterm ilike ?", "%#{query}%") 

	end



	
	
end
