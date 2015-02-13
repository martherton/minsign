class Admin::DocstructuresController < ApplicationController
	before_filter :authenticate_user!
	def index
		if current_user.has_role? :admin
			@docstructures = policy_scope(Docstructure)
		else
			redirect_to	new_user_find_path(current_user.id)
		end		
	end
	
	def new
		if current_user.has_role? :admin
			@user = current_user
    	@docstructure = @user.docstructures.new
		else
			redirect_to	new_user_find_path(current_user.id)
		end	
	end

	def create
		if current_user.has_role? :admin
				
		    @user = current_user
		    @docstructure = @user.docstructures.new(docstructure_params)
		    @docstructure.sandbox = false
		    if @docstructure.save
		    	redirect_to admin_docstructures_path
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
	    @docstructure = @user.docstructures.find(params[:id])
	  else
			redirect_to	new_user_find_path(current_user.id)
	  end  
	end	

	def update
		if current_user.has_role? :admin
		
	    @user = current_user
	    @docstructure = @user.docstructures.find(params[:id])

	    if @docstructure.update(docstructure_params)
	        flash[:success] = "Your heading was updated"
	        redirect_to admin_docstructures_path
	    else
	      flash[:error] = "Oops. There has been a problem, please retry."
	        redirect_to admin_docstructures_path
	      
	    end
	  else
			redirect_to	new_user_find_path(current_user.id)
		end	   
	end

	def destroy

	end

	private

	def docstructure_params
		params.require(:docstructure).permit(:headingname, :user_id, :released, :sandbox, :liveissue)
	end	

end
