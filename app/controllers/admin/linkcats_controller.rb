class Admin::LinkcatsController < ApplicationController
	before_filter :authenticate_user!

	def index
		if current_user.has_role? :admin
			@linkcats = policy_scope(Linkcat)
		else
			redirect_to	new_user_find_path(current_user.id)
		end		
	end
	
	def new
		if current_user.has_role? :admin
			@user = current_user
    	@linkcat = @user.linkcats.new
		else
			redirect_to	new_user_find_path(current_user.id)
		end	
	end

	def create
		if current_user.has_role? :admin
				
		    @user = current_user
		    @linkcat = @user.linkcats.new(linkcat_params)
		    if @linkcat.save
		    	redirect_to root_path
		  	else
		    	render :new
		   	end 
		else
			redirect_to	new_user_find_path(current_user.id)
		end	   	
	end

	def update
		if current_user.has_role? :admin
		
	    @user = current_user
	    @linkcat = @user.linkcats.find(params[:id])

	    if @linkcat.update(linkcat_params)
	        flash[:success] = "Your linkcat was updated"
	        redirect_to admin_linkcat_path(@linkcat.id)
	    else
	      flash[:error] = "Oops. There has been a problem, please retry."
	      render :edit
	    end
	  else
			redirect_to	new_user_find_path(current_user.id)
		end	   
	end

	def destroy

	end

	private

	def linkcat_params
    params.require(:linkcat).permit(:linkcatname, :linkcatdesc, :linkcattype, :user_id)

	end	

end
