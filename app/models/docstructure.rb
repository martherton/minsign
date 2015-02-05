class Docstructure < ActiveRecord::Base
	has_many :declaratives
	belongs_to :user

end
