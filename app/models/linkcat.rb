class Linkcat < ActiveRecord::Base
	belongs_to :user
	has_many :finds
	has_many :wlinks
end
