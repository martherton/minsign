class MoreinfosController < ApplicationController
	
	def new
		@moreinfo = Moreinfo.new
	end	
	
	def create
		@moreinfo = Moreinfo.new(moreinfo_params)
		if @moreinfo.save
			flash[:success] = "Thankyou for expressing an interest in MinervaSI"
			redirect_to '/thanks'

		else
			flash[:failure] = "There appears to be a problem, please try again"
			redirect_to_root
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
