class Wlink < ActiveRecord::Base
	belongs_to :user
	belongs_to :linkcat
	validates :wlinkurl, presence: true, uniqueness: true
	validates :wlinkname, presence: true
	validates :wlinkdesc, presence: true
	validates :wlinkveri, presence: true

	acts_as_taggable

end
