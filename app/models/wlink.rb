class Wlink < ActiveRecord::Base
	belongs_to :user
	belongs_to :linkcat
	validates :wlinkurl, presence: true
	validates :wlinkname, presence: true
	validates :wlinkdesc, presence: true
	validates :wlinkveri, presence: true
	validates :wlinksource, presence: true
	validates :wlinkyear, presence: true
	validates :wlinklang, presence: true



	acts_as_taggable

	def self.search(query)
  	
  	joins(:tags).where("wlinkname like ? or wlinkdesc like ? or name like?", "%#{query}%", "%#{query}", "%#{query}") 

	end

	require "net/http"

	def url_exist?(url_string)
	  url = URI.parse(url_string)
	  req = Net::HTTP.new(url.host, url.port)
	  req.use_ssl = (url.scheme == 'https')
	  path = url.path if url.path.present?
	  res = req.request_head(path || '/')
	  if res.kind_of?(Net::HTTPRedirection)
	    url_exist?(res['location']) # Go after any redirect and make sure you can access the redirected URL 
	  else
	    res.code[0] != "4" #false if http code starts with 4 - error on your side.
	  end
	rescue Errno::ENOENT
	  false #false if can't find the server
	end
end
