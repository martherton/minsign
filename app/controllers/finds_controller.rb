class FindsController < ApplicationController
	before_filter :authenticate_user!
	

	def index

	end

	def new
		@user = current_user
		@find = @user.finds.new
	end
	
	def show

	end	

	def edit

	end	
	
	def create

	end

	def destroy

	end
end
