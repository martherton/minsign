class Docstructure < ActiveRecord::Base
	has_many :declaratives
	belongs_to :user

	validates :headingname, presence: true, uniqueness: true

end
