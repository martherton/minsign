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
    	@linkcat = Linkcat.new
		else
			redirect_to	new_user_find_path(current_user.id)
		end	
	end

	def create
		if current_user.has_role? :admin
				
		    @user = current_user
		    @linkcat = Linkcat.new(linkcat_params)
		    @linkcat.sandbox = false
		    if @linkcat.save
		    	redirect_to admin_linkcats_path
		  	else
		    	render :new
		   	end 
		else
			redirect_to	new_user_find_path(current_user.id)
		end	   	
	end

	def edit
		if current_user.has_role? :admin

	    @user = current_user
	    @linkcat = Linkcat.find(params[:id])
	  else
			redirect_to	new_user_find_path(current_user.id)
	  end  
	end	

	def update
		if current_user.has_role? :admin
		
	    @user = current_user
	    @linkcat = Linkcat.find(params[:id])

	    if @linkcat.update(linkcat_params)
	        flash[:success] = "Your linkcat was updated"
	        redirect_to admin_linkcats_path
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
    params.require(:linkcat).permit(:linkcatname, :linkcatdesc, :linkcattype, :linkcatview, :linkcatmaxres, :user_id, :released, :sandbox)

	end	

end
