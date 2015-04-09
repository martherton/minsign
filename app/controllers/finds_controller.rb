class FindsController < ApplicationController
	before_filter :authenticate_user!
	before_filter :find_tags, only: [:new, :create, :edit, :update] 
	
	def index

	end

	def new
		
		if current_user.has_role? :user or :user
			@user = current_user
			
			@linkcat1 = Linkcat.joins(:declaratives).where(declaratives: {user_id: current_user.id})
			@linkcat2 = Linkcat.where("released = ?", true)
			@linkcat = @linkcat1 | @linkcat2
			@heading1 = Docstructure.joins(:declaratives).where(declaratives: {user_id: current_user.id})
			@heading2 = Docstructure.where("released = ?", true)
			@heading = @heading1 | @heading2
			@find = @user.finds.new

		else
			redirect_to root_path
		end		

	end




	
	def show

	end	

	def update
		
			   
	end	
	
	def create  
		if current_user.has_role? :admin or :user
				
		    @user = current_user
		    @find = @user.finds.new(find_params)
		    	
		    if @find.save
		    	@searchterm = @find.tag_list.join(",")
		    	if @find.linkcat_id.nil?
		    		redirect_to user_declaratives_path(current_user.id, queryid: @find.docstructure_id, query: @searchterm, q: 'h')
		    	else	
			    	if Linkcat.find(@find.linkcat_id).linkcattype == 'Curated Weblinks'
			    		redirect_to user_wlinks_path(current_user.id, queryid: @find.linkcat_id, query: @searchterm)
			    	elsif 	Linkcat.find(@find.linkcat_id).linkcattype == 'Information'
			    		redirect_to user_declaratives_path(current_user.id, q: @find.linkcat_id, query: @searchterm, queryid: @find.docstructure_id)
			    	end	
			    end	
			  else
			  			flash[:failure] = "Select a module and enter a search term"
			    		redirect_to new_user_find_path(current_user.id)
			  end 
			   	
		else
			redirect_to	new_user_find_path(current_user.id)
		end	   
	end
	


	def tags
	  tag1 = Declarative.all_tag_counts.by_tag_name(params[:q]).token_input_tags 
	  tag2 = Wlink.all_tag_counts.by_tag_name(params[:q]).token_input_tags
	  tags = tag1 | tag2
	  respond_to do |format|
    	format.json { render json: tags } 
  	end


	end
	
private
	

	def find_params
		params.require(:find).permit(:searchterm, :linkcat_id, :user_id, :docstructure_id, :tag_list_tokens)
	end	


	def find_tags
  	@declarative_tags = params[:id].present? ? Declarative.find(params[:id]).tags.token_input_tags : []
  	@wlink_tags = params[:id].present? ? Wlink.find(params[:id]).tags.token_input_tags : []
  	@all_tags = @declarative_tags && @wlink_tags

	end


	
end
