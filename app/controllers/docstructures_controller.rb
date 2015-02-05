class DocstructuresController < ApplicationController



private

	def docstructure_params
		params.require(:doscstructure).permit(:headingname)
	end	
end
