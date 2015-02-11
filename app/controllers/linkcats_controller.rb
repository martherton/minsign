class LinkcatsController < ApplicationController
	
	before_filter :authenticate_user!

	def index
		if current_user.has_role? :sandbox
			@linkcats = policy_scope(Linkcat)
		else
			redirect_to	new_user_find_path(current_user.id)
		end		
	end
	
	def new
		if current_user.has_role? :sandbox
			@user = current_user
    	@linkcat = @user.linkcats.new
		else
			redirect_to	new_user_find_path(current_user.id)
		end	
	end

	def create
		if current_user.has_role? :sandbox
				
		    @user = current_user
		    @linkcat = @user.linkcats.new(linkcat_params)
		    @linkcat.linkcattype = "Information"
		    @linkcat.linkcatview = "Report"
		    @linkcat.linkcatmaxres = 8
		    @linkcat.sandbox = true
		    @linkcat.released = false
		    if @linkcat.save
		    	flash[:success] = "Your topic was created" 

		    	redirect_to new_user_declarative_path(current_user.id)
		  	else
		  		flash[:failure] = "Check the input"
		    	render :new
		   	end 
		else
			redirect_to	new_user_find_path(current_user.id)
		end	   	
	end

	def edit
		if current_user.has_role? :sandbox

	    @user = current_user
	    @linkcat = @user.linkcats.find(params[:id])
	  else
			redirect_to	new_user_find_path(current_user.id)
	  end  
	end	

	def update
		if current_user.has_role? :sandbox
		
	    @user = current_user
	    @linkcat = @user.linkcats.find(params[:id])
	    @linkcat.linkcattype = "Information"
		    @linkcat.linkcatview = "Report"
		    @linkcat.linkcatmaxres = 8
		    @linkcat.sandbox = true
		    @linkcat.released = false
	    if @linkcat.update(linkcat_params)
	        flash[:success] = "Your Topic was updated"
	        redirect_to user_linkcats_path
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

	
	
	def show

	end	

	private

	def linkcat_params
    params.require(:linkcat).permit(:linkcatname, :linkcatdesc, :linkcattype, :linkcatview, :linkcatmaxres, :user_id, :sandbox)

	end	
	
	

	
end
