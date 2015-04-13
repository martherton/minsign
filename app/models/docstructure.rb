class Docstructure < ActiveRecord::Base
	has_many :declaratives
	belongs_to :user
	belongs_to :draft
	has_many :images

	validates :headingname, presence: true, uniqueness: true

end
