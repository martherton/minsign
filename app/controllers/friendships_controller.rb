class FriendshipsController < ApplicationController
	before_filter :authenticate_user!

	def new
		if current_user.has_role? :user
			
			
			@friendship = Friendship.new
		else
			redirect_to root_path
		end
	end	

	def create
		@user =current_user
		@friends = Friendship.where(user_id: @user.id).count
		@invfriends = Friendship.where(friend_id: @user.id).count
		@fr = @friends + @invfriends
		if @fr > 3 && @user.freeuser == true
			flash[:failure] = "Your friend limit has been reached, if you require more please upgrade"
			redirect_to dashboard_user_path(current_user.id)
		else	
			




				@friendship = Friendship.new(friendship_params)
						@friendid = User.find_by(email: @friendship.emailf).id
						@friendship = 0


		if Friendship.where('friend_id = ? AND user_id = ?', @friendid, current_user.id).blank?
				
			if Friendship.where('user_id = ? AND friend_id = ?', @friendid, current_user.id).blank?	
		
				@friendship = Friendship.new(friendship_params)

		
				if User.exists?(email: @friendship.emailf)
					if @friendship.emailf == current_user.email
						flash[:failure] = "That is your own email address address!"
						redirect_to dashboard_user_path(current_user.id)

					else	

						@friendid = User.find_by(email: @friendship.emailf).id
				
						@useremail = User.find_by(email: @friendship.emailf).email

				
				
						@friendship.friend_id = @friendid
						if @friendship.save
							flash[:success] = "Friend request sent"
							redirect_to dashboard_user_path(current_user.id)
						else
							flash[:error] = "Unable to send friend request"
							redirect_to dashboard_user_path(current_user.id)
						end
					end	

				else	
					flash[:failure] = "This user is not a member or you may have typed the email incorrectly."
					redirect_to dashboard_user_path(current_user.id)


				end

				else
					flash[:failure] = "This person is already a friend!"
					redirect_to dashboard_user_path(current_user.id)
				end
			else
				flash[:failure] = "This person is already a friend!"
				redirect_to dashboard_user_path(current_user.id)	
			end	
		end	


		

			
						
				
	
	end
	
	def destroy

		@friendship = Friendship.find(params[:q])
		if @friendship.friend_id = current_user.id
			@friendship.destroy
			flash[:notice] = "Removed friend"
			redirect_to dashboard_user_path(current_user.id)
		elsif 	@friendship.user_id = current_user.id
			@friendship.destroy
			flash[:notice] = "Removed friend"
			redirect_to dashboard_user_path(current_user.id)
		else
		  flash[:failure] = "Not destroyed"
		end  	
	end	

	def show

	end	

	def approval
		
		
		if params[:q] == 'approved'
			@friendship = Friendship.find(params[:id])
			if current_user.id == @friendship.friend_id
	 			if @friendship.update_attributes(approved: true)
	 				flash[:success] = 'friend request approved'
	 				redirect_to dashboard_user_path(current_user.id)
	 			else
	 				flash[:failure] = 'there has been a problem'
	 				redirect_to dashboard_user_path(current_user.id)
	 			end
	 		else
	 			flash[:failure] = 'this is not your friend request'
	 			redirect_to dashboard_user_path(current_user.id)
	 		end		
 		elsif params[:q] == 'declined'	
			@friendship = Friendship.find(params[:id])
 				
			if current_user.id == @friendship.friend_id

	 			if @friendship.destroy
	 				flash[:success] = 'friend request declined'
	 				redirect_to dashboard_user_path(current_user.id)
	 			else
	 				flash[:failure] = 'there has been a problem'
	 				redirect_to dashboard_user_path(current_user.id)
	 			end
	 		else
	 			flash[:failure] = 'there has been a problem'
	 			redirect_to dashboard_user_path(current_user.id)
	 		end			
 		else		
			redirect_to dashboard_user_path(current_user.id)
		end		
		
	end
	
	

	private

	def friendship_params
		params.require(:friendship).permit(:friend_id, :approved, :user_id, :emailf)
	end	
end
