class Admin::WlinksController < ApplicationController
	before_filter :authenticate_user!

	def index
		if current_user.has_role? :admin
			@wlinker = policy_scope(Wlink)
			@wlinks = @wlinker.where(linkcat_id: params[:query]).find_each
		else
			redirect_to	new_user_find_path(current_user.id)
		end		
	end
	
	def new
		if current_user.has_role? :admin
			@user = current_user
    	@wlink = @user.wlinks.new

		else
			redirect_to	admin_wlinks_path(query: @wlink.linkcat_id)
		end	
	end

	def edit
		if current_user.has_role? :admin

	    @user = current_user
	    @wlink = @user.wlinks.find(params[:id])

	  else
	  	 redirect_to admin_wlinks_path(query: @wlink.linkcat_id)
	  end	 
  
  end

	def create 
		if current_user.has_role? :admin
				
		    @user = current_user
		    @wlink = @user.wlinks.new(wlink_params)

		    if @wlink.save
		    	redirect_to admin_wlinks_path(query: @wlink.linkcat_id)
		  	else
		    	render :new
		    	flash[:error] = "Check the input"
		   	end 
		else
			redirect_to	new_user_find_path(current_user.id)
		end	   	
	end

	def update
		if current_user.has_role? :admin
		
	    @user = current_user
	    @wlink = @user.wlinks.find(params[:id])

	    if @wlink.update(wlink_params)
	        flash[:success] = "Your linkcat was updated"
	        redirect_to admin_wlinks_path(query: @wlink.linkcat_id)
	    else
	      flash[:error] = "Oops. There has been a problem, please retry."
	      render :edit
	    end
	  else
			redirect_to	new_user_find_path(current_user.id)
		end	   
	end

	def destroy
		if current_user.has_role? :admin

	    @user = current_user
	    @wlink = @user.wlinks.find(params[:id])
	    @wlink.destroy
	    flash[:success] = "This link was deleted succesfully"
	    redirect_to admin_wlinks_path(query: @wlink.linkcat_id)
	  else
	        redirect_to admin_wlinks_path(query: @wlink.linkcat_id)
	  end	  
	    
	end

	def brokenlinks

		@wlinks = Wlink.all

	end	

	private

	def wlink_params
    params.require(:wlink).permit(:wlinkname, :wlinkurl, :wlinkdesc, :wlinkveri, :wlinksource, :wlinkyear, :linkcat_id, :wlinklang, :user_id, :tag_list)

	end	
end
