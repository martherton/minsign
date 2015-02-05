class UsersController < ApplicationController
	before_filter :authenticate_user!
	
	def dashboard
		if current_user.has_role? :user
			@user = policy_scope(User)
			@user = current_user
			@role = @user.role_ids
			@findsa = Find.where(:user_id => params[:id]).order(created_at: :desc)
			@finds = @findsa.limit(5)
			@mostfinds = Find.where(:user_id => params[:id]).group(:linkcat_id)
			@mostfindsa = @mostfinds.all.group(:searchterm)
			@mostfindsb = @mostfindsa.order('count_all desc').limit(5).count

			@total = Find.where(:user_id => params[:id]).count

			
		else 
			redirect_to root_path
		end	
			
		
	end	


end
