class Linkcat < ActiveRecord::Base
	belongs_to :user
	
	has_many :wlinks

	validates :linkcattype, presence: true
	validates :linkcatdesc, presence: true
	validates :linkcatname, presence: true, uniqueness: true
	validates :linkcatview, presence: true
	validates :linkcatmaxres, presence: true
end
