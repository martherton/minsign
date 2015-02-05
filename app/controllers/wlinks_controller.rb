class WlinksController < ApplicationController
	before_filter :authenticate_user!
	

	
	
	def index
		if current_user.has_role? :admin or :user
			@user = current_user
			@wlinksfromlinkcat = Wlink.where(:linkcat_id => params[:queryid])
			@wlinkss = @wlinksfromlinkcat.search(params[:query]) 
			@wlinkst = @wlinksfromlinkcat.tagged_with(params[:query])
			@searchterm = params[:query]
			@module = Linkcat.find(params[:queryid])
			@wlinks = @wlinkss | @wlinkst
			@linkcatmax = Linkcat.where(:id => params[:queryid])
			@count = @wlinks.count
			
		else
			redirect to root_path
		end		
	end	

	
	
	


end

