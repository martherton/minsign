class WlinksController < ApplicationController
	before_filter :authenticate_user!
	

	
	
	def index
		if current_user.has_role? :admin or :user
			@user = current_user
			@linkcatrel = @user.linkcats.map(&:id)  #linkcats in your package
			if @linkcatrel.include? params[:queryid]
				@wlinksfromlinkcat = Wlink.where(:linkcat_id => params[:queryid])
				@wlinkss = @wlinksfromlinkcat.search(params[:query]) 
				@wlinkst = @wlinksfromlinkcat.tagged_with(params[:query])
				@searchterm = params[:query]
				@module = Linkcat.find(params[:queryid])
				@wlinks = @wlinkss | @wlinkst
				@linkcatmax = Linkcat.where(:id => params[:queryid])
				@count = @wlinks.count
			else
			 flash[:error] = "Unfortunately you are not approved to access curated links in this area"
			 redirect_to	new_user_find_path(current_user.id)
			end 	
			
		else
			redirect to root_path
		end		
	end	

	
	
	


end

