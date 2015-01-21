class FindsController < ApplicationController
	before_filter :authenticate_user!
	

	def index

	end

	def new
		
		if current_user.has_role? :user or :user
			@user = current_user
			
			@find = @user.finds.new
		else
			redirect_to root_path
		end		
	end
	
	def show

	end	

	def edit

	end	
	
	def create
		if current_user.has_role? :admin or :user
				
		    @user = current_user
		    @find = @user.finds.new(find_params)
		    if @find.save
		    	redirect_to user_wlinks_path(current_user.id, queryid: @find.linkcat_id, query: @find.searchterm)
		  	else
		  		flash[:failure] = "Select a module an enter a search term"
		    	redirect_to new_user_find_path(current_user.id)
		   	end 
		else
			redirect_to	new_user_find_path(current_user.id)
		end	   
	end

	

	private

	def find_params
		params.require(:find).permit(:searchterm, :linkcat_id, :user_id)
	end	
end
