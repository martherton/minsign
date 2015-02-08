class Admin::FindsController < ApplicationController
	before_filter :authenticate_user!
	

	def index
		if current_user.has_role? :admin

			if params[:search].present? and params[:search][:q].present?
				
				  @finds = Find.search(params[:search][:q])
				  @users = User.select("email").group("email") 
					@linkcats = Linkcat.select("linkcatname").group("linkcatname") 
					
					@findscount = Find.count
					@findslinkcat = Find.group("linkcat_id").count
					@findsuser = Find.group("user_id").count
				elsif   params[:search].present? and params[:search][:q1].present?
				  @finds = Find.where(:user_id => params[:search][:q1])
				  @users = User.group("email")
					@linkcats = Linkcat.group("linkcatname") 
						
					@findscount = Find.count
					@findslinkcat = Find.group("linkcat_id").count
					@findsuser = Find.group("user_id").count
				elsif   params[:search].present? and params[:search][:q2].present? 
				  @finds = Find.where(:linkcat_id => params[:search][:q2])
					@users = User.select("email").group("email") 
					@linkcats = Linkcat.select("linkcatname").group("linkcatname") 
					
					@findscount = Find.count
					@findslinkcat = Find.group("linkcat_id").count
					@findsuser = Find.group("user_id").count
				else	
					@users = User.select("email").group("email")
					@linkcats = Linkcat.select("linkcatname").group("linkcatname") 
					@finds = Find.all
					@findscount = Find.count
					@findslinkcat = Find.group("linkcat_id").count
					@findsuser = Find.group("user_id").count
				end	
		else
			redirect_to new_user_find_path(current_user.id)
		end		
	end	
end
