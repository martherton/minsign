class CommentsController < ApplicationController
	before_filter :authenticate_user!

	def index

	end

	def new
		
		if current_user.has_role? :user or :user
			
			
			@comment = Comment.new
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
				
		   
		    @comment = Comment.new(comment_params)
		    if @comment.save

		    	redirect_to	dashboard_user_path(current_user.id)
		  	else
		    	render :new
		   	end 
		else
			redirect_to	new_user_find_path(current_user.id)
		end	   
	end

	

	private

	def comment_params
		params.require(:comment).permit(:contentcom, :user_id)
	end	

end
