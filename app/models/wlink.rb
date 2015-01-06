class Wlink < ActiveRecord::Base
	belongs_to :user
	belongs_to :linkcat
	validates :wlinkurl, presence: true, uniqueness: true
	validates :wlinkname, presence: true
	validates :wlinkdesc, presence: true
	validates :wlinkveri, presence: true
	validates :wlinksource, presence: true
	validates :wlinkyear, presence: true
	validates :wlinklang, presence: true



	acts_as_taggable

	def self.search(query)
  	
  	where("wlinkname like ? or wlinkdesc like ?", "%#{query}%", "%#{query}") 

	end
end
t.string   "wlinkname"
    t.string   "wlinkurl"
    t.string   "wlinkdesc"
    t.string   "wlinkveri"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "user_id"
    t.integer  "linkcat_id"
    t.string   "wlinksource"
    t.date     "wlinkyear"
    t.string   "wlinklang"