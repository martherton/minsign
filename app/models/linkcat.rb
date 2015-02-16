class Linkcat < ActiveRecord::Base
	has_and_belongs_to_many :user
	
	has_many :wlinks
	has_many :declaratives

	validates :linkcattype, presence: true
	validates :linkcatdesc, presence: true
	validates :linkcatname, presence: true, uniqueness: true
	validates :linkcatview, presence: true
	validates :linkcatmaxres, presence: true
end
