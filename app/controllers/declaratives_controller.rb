class DeclarativesController < ApplicationController

	def new

		if current_user.has_role? :sandbox or :admin
			@user = current_user
    	@declarative = @user.declaratives.new
    	@linkcat = Linkcat.where("released = ? OR user_id = ?", true, current_user.id)

    	@headings = Docstructure.where("released = ? OR user_id = ?", true, current_user.id)
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
		if current_user.has_role? :admin or :sandbox
				
		    @user = current_user
		    @declarative = @user.declaratives.new(declarative_params)
		    if @declarative.save
		    	flash[:success] = "Data Entry Successfully Added"
		    		redirect_to new_user_declarative_path
		    	
		  	else
		  		flash[:error] = "Check your input"
		    	redirect_to new_user_declarative_path
		   	end 
		else
			redirect_to	new_user_find_path(current_user.id)
		end	 
	end

	def index
		if current_user.has_role? :admin or :user
				@a = 0

				if params[:q] == 'h'
					if params[:queryid].present?
						@a = @a +1
						@user = current_user
						@declarativesfromlinkcat = Declarative.where(:docstructure_id => params[:queryid]).order(:linkcat_id)
						@declarativess = @declarativesfromlinkcat.search(params[:query]) 
						@declarativest = @declarativesfromlinkcat.tagged_with(params[:query])
						@searchterm = params[:query]
						@module = Docstructure.find(params[:queryid])
						@declaratives = @declarativess | @declarativest
						@linkcatmax = Docstructure.where(:id => params[:queryid])
						@count = @declaratives.count
						@request = Docstructure.find(params[:queryid]).headingname
					else
						@a = @a +1
						@user = current_user
						@declarativess = Declarative.search(params[:query]) 
						@declarativest = Declarative.tagged_with(params[:query])
						@searchterm = params[:query]
						@module = "All"
						@declaratives = @declarativess | @declarativest
						@linkcatmax = 0
						@count = @declaratives.count
						@request = "All"
					end	
				elsif params[:q].present?
					@a = @a +1
					@user = current_user
					@declarativesfromlinkcat = Declarative.where(:linkcat_id => params[:queryid])
					@declarativess = @declarativesfromlinkcat.search(params[:query]) 
					@declarativest = @declarativesfromlinkcat.tagged_with(params[:query])
					@declarativesu = @declarativesfromlinkcat.where(:docstructure_id => params[:q])
					@searchterm = params[:query]
					@module = Linkcat.find(params[:queryid])
					@declarativesv = @declarativess | @declarativest
					@declaratives = @declarativesv & @declarativesu
					@linkcatmax = Linkcat.where(:id => params[:queryid])
					@count = @declaratives.count
					@request = Linkcat.find(params[:queryid]).linkcatname
				else	
					@a = @a +1
					@user = current_user
					@declarativesfromlinkcat = Declarative.where(:linkcat_id => params[:queryid]).order(:docstructure_id)
					@declarativess = @declarativesfromlinkcat.search(params[:query]) 
					@declarativest = @declarativesfromlinkcat.tagged_with(params[:query])
					@searchterm = params[:query]
					@module = Linkcat.find(params[:queryid])
					@declaratives = @declarativess | @declarativest
					@linkcatmax = Linkcat.where(:id => params[:queryid])
					@count = @declaratives.count
					@request = Linkcat.find(params[:queryid]).linkcatname
				end	
				
		else
			redirect to root_path
		end		
	end	

	def edit
		if current_user.has_role? :sandbox

	    @user = current_user
	    @linkcat = Linkcat.all

    	@headings = Docstructure.all
	    @declarative = @user.declaratives.find(params[:id])

	  else
			redirect_to	new_user_find_path(current_user.id)
	  end  
	end	

	def update
		if current_user.has_role? :sandbox
		
	    @user = current_user
	    @declarative = @user.declaratives.find(params[:id])

	    if @declarative.update(declarative_params)
	        flash[:success] = "Your heading was updated"
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
		if current_user.has_role? :sandbox

	    @user = current_user
	    @declarative = @user.declaratives.find(params[:id])
	    @declarative.destroy
	    flash[:success] = "This data was deleted succesfully"
	    redirect_to user_declaratives_path(current_user.id, query: @declarative.linkcat_id)
	  else
	        redirect_to user_declaratives_path(current_user.id, query: @declarative.linkcat_id)
	  end	 
	end
	
	private

	def declarative_params
		params.require(:declarative).permit(:urlsource, :declarativetext, :declarativejusttext, :user_id, :docstructure_id, :datapoint, :units, :entryhierarchy, :texttype, :entryend, :endsection, :linkcat_id, :user_id, :sandbox, :urlextra, :reviewdate)
	end	
end


