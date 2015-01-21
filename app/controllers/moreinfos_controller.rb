class MoreinfosController < ApplicationController
	
	def new
		@moreinfo = Moreinfo.new
	end	
	
	def create
		@moreinfo = Moreinfo.new(moreinfo_params)
		if @moreinfo.save
			flash[:success] = "Thankyou for expressing an interest in MinervaSI"
			redirect_to root_path

		else
			flash[:failure] = "You have already signed up for updates"
			redirect_to root_path
		end		
	end

	def destroy

	end

	def index

	end	

	private

	def moreinfo_params
		params.require(:moreinfo).permit(:email)
	end	

	
end
