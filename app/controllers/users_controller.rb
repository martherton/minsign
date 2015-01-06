class UsersController < ApplicationController
	before_filter :authenticate_user!
	
	def dashboard
		if current_user.has_role? :user
			@user = policy_scope(User)
			@user = current_user
			@role = @user.role_ids
			@finds = Find.where(:user_id => params[:id]).limit(5)
		else 
			redirect_to root_path
		end	
			
		
	end	

	
end
