class Friendship < ActiveRecord::Base
	belongs_to :user
	belongs_to :friend, class_name: "User"

	attr_accessor :emailf

	after_save do 
		send_friend_email(@useremail)
	end	
		
	
	private

	def send_friend_email(email)

	end	

end