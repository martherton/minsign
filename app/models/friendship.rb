class Friendship < ActiveRecord::Base
	belongs_to :user
	belongs_to :friend, class_name: "User"

	attr_accessor :emailf

	after_save do 
		send_friend_email
	end	
		
	
	private

	def send_friend_email
		FriendMailer.friend_request(self).deliver
	end	

end
