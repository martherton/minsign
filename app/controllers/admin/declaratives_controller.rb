class Admin::DeclarativesController < ApplicationController
	before_filter :authenticate_user!
	layout 'users/declaratives'
	def index
		if current_user.has_role? :admin
			@declarative = policy_scope(Declarative)
			@decs = @declarative.where(linkcat_id: params[:query]).find_each
		else
			redirect_to	new_user_find_path(current_user.id)
		end		
	end
	
	def new
		if current_user.has_role? :admin
			@user = current_user
    	@declarative = @user.declaratives.new
    	if params[:q].present?
    		@declarative.declarativejusttext = params[:q]
    	else
    	end	
    	@linkcat = Linkcat.all

    	@headings = Docstructure.all
    	@declarativelast = Declarative.where(user_id: @user.id).order("created_at").last
    	if @declarativelast.nil?

    	elsif @declarativelast.entryend == false
    		if @declarativelast.endsection == false
    			@area = @declarativelast.linkcat_id
    			@headinglast = @declarativelast.docstructure_id
    			@urllast = @declarativelast.urlsource
    		else
    			@urllast = @declarativelast.urlsource
    		end
    	else		
    	end	

		else
			redirect_to	new_user_find_path(current_user.id)
		end	
	end

	def create
		if current_user.has_role? :admin
				
		    @user = current_user
		    @declarative = @user.declaratives.new(declarative_params)
		    @declarative.sandbox = false
		    if @declarative.save
		    	flash[:success] = "Data Entry Successfully Added"
		    		redirect_to new_admin_declarative_path
		    	
		  	else
		  		flash[:error] = "Check your input"
		    	redirect_to new_admin_declarative_path(current_user.id, q: @declarative.declarativejusttext)

		   	end 
		else
			redirect_to	new_user_find_path(current_user.id)
		end	   	
	end

	def edit
		if current_user.has_role? :admin

	    @user = current_user
	    @linkcat = Linkcat.all

    	@headings = Docstructure.all
	    @declarative = @user.declaratives.find(params[:id])

	  else
			redirect_to	new_user_find_path(current_user.id)
	  end  
	end	

	def update
		if current_user.has_role? :admin
		
	    @user = current_user
	    @declarative = @user.declaratives.find(params[:id])

	    if @declarative.update(declarative_params)
	        flash[:success] = "Your data was updated"
	        redirect_to admin_declaratives_path(query: @declarative.linkcat_id)
	    else
	      flash[:error] = "Oops. There has been a problem, please retry."
	        redirect_to admin_declaratives_path
	      
	    end
	  else
			redirect_to	new_user_find_path(current_user.id)
		end	   
	end

	def destroy
		if current_user.has_role? :admin

	    @user = current_user
	    @declarative = @user.declaratives.find(params[:id])
	    @declarative.destroy
	    flash[:success] = "This data was deleted succesfully"
	    redirect_to admin_declaratives_path(query: @declarative.linkcat_id)
	  else
	        redirect_to admin_declaratives_path(query: @declarative.linkcat_id)
	  end	 
	end

	private

	def declarative_params
		params.require(:declarative).permit(:urlsource, :declarativetext, :declarativejusttext, :user_id, :docstructure_id, :datapoint, :units, :entryhierarchy, :texttype, :entryend, :endsection, :linkcat_id, :user_id, :urlextra, :declarativeimage, :sandbox, :reviewdate)
	end	

end
