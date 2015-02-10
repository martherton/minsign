class DeclarativesController < ApplicationController




	def new

		if current_user.has_role? :sandbox or :admin
			@user = current_user
    	@declarative = @user.declaratives.new
    	
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
		if current_user.has_role? :admin or :sandbox
				
		    @user = current_user
		    @declarative = @user.declaratives.new(declarative_params)
		    @declarative.sandbox = true
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
				
			
				if params[:q] == 'h'  #check for topic h means not present
					if params[:queryid].present? # check for heading with no topic
						if params[:query].present? #Topic and query search
							#Set up the Declaratives that the user can search
							@user = current_user #identify current user
							@linkrel = Linkcat.where(released: true) 
							@decallowed = Declarative.where("linkcat_id = ? or user_id = ?", @linkrel[0], current_user.id).order(:linkcat_id).order(:docstructure_id).order(:sandbox).order(:created_at) #set up a list of the declaratives allowed to be accessed by the user
							@declarativesfromlinkcat = @decallowed.where(:docstructure_id => params[:queryid]) #Further reduce as this is only a heading search
							@declarativess = @declarativesfromlinkcat.search(params[:query]) #search for non tagged terms
							@declarativest = @declarativesfromlinkcat.tagged_with(params[:query]) #search for tagged terms
							@declaratives = @declarativess | @declarativest #remove duplicate declaratives
							

							#Labelling data for the search	
							
							@searchterm = params[:query]
							@topic = "All"
							@count = @declaratives.count
							@request = Docstructure.find(params[:queryid]).headingname
						else	#Heading search only
							#Set up the Declaratives that the user can search
							@user = current_user #identify current user
							@linkrel = Linkcat.where(released: true) 
							@decallowed = Declarative.where("linkcat_id = ? or user_id = ?", @linkrel[0], current_user.id).order(:linkcat_id).order(:docstructure_id).order(:sandbox).order(:created_at) #set up a list of the declaratives allowed to be accessed by the user
							@declarativesfromlinkcat = @decallowed.where(:docstructure_id => params[:queryid]) #Further reduce as this is only a heading search
							@declarativess = @declarativesfromlinkcat.search(params[:query]) #search for non tagged terms
							@declarativest = @declarativesfromlinkcat.tagged_with(params[:query]) #search for tagged terms
							@declaratives = @declarativess | @declarativest #remove duplicate declaratives
							

							#Labelling data for the search	
							
							@searchterm = params[:query]
							@topic = "All"
							@count = @declaratives.count
							@request = Docstructure.find(params[:queryid]).headingname
						end	
					elsif params[:query].present? #query only search
						
						#Set up the Declaratives that the user can search
							@user = current_user #identify current user
							@linkrel = Linkcat.where(released: true) 
							@decallowed = Declarative.where("linkcat_id = ? or user_id = ?", @linkrel[0], current_user.id).order(:linkcat_id).order(:docstructure_id).order(:sandbox).order(:created_at) #set up a list of the declaratives allowed to be accessed by the user
							@declarativesfromlinkcat = @decallowed
							@declarativess = @declarativesfromlinkcat.search(params[:query]) #search for non tagged terms
							@declarativest = @declarativesfromlinkcat.tagged_with(params[:query]) #search for tagged terms
							@declaratives = @declarativess | @declarativest #remove duplicate declaratives
							

							#Labelling data for the search	
							
							@searchterm = params[:query]
							@topic = "All"
							@count = @declaratives.count
							@request = "All"
					else #No entry return to search
						flash[:failure] = "No search entered"
						redirect_to	new_user_find_path(current_user.id)
					end	

				elsif params[:queryid].present? #Check for heading if topic present
					if params[:query].present? #Topic, heading and query serach (most detailed)
						
						#Set up the Declaratives that the user can search
							@user = current_user #identify current user
							@linkrel = Linkcat.where(released: true) 
							@decallowed = Declarative.where("linkcat_id = ? or user_id = ?", @linkrel[0], current_user.id).order(:linkcat_id).order(:docstructure_id).order(:sandbox).order(:created_at) #set up a list of the declaratives allowed to be accessed by the user
							@declarativesfromlinkcat = @decallowed.where("docstructure_id = ? AND linkcat_id = ?", params[:queryid], params[:q]) #Further reduce as this is only a heading search

							@declarativess = @declarativesfromlinkcat.search(params[:query]) #search for non tagged terms
							@declarativest = @declarativesfromlinkcat.tagged_with(params[:query]) #search for tagged terms
							@declaratives = @declarativess | @declarativest #remove duplicate declaratives
							

							#Labelling data for the search	
							
							@searchterm = params[:query]
							@topic = Linkcat.find(params[:q]).linkcatname
							
							@count = @declaratives.count
							@request = Docstructure.find(params[:queryid]).headingname
					else #Topic and heading search
						#Set up the Declaratives that the user can search
							@user = current_user #identify current user
							@linkrel = Linkcat.where(released: true) 
							@decallowed = Declarative.where("linkcat_id = ? or user_id = ?", @linkrel[0], current_user.id).order(:linkcat_id).order(:docstructure_id).order(:sandbox).order(:created_at) #set up a list of the declaratives allowed to be accessed by the user
							@declarativesfromlinkcat = @decallowed.where("docstructure_id = ? AND linkcat_id = ?", params[:queryid], params[:q]) #Further reduce as this is only a heading search

							@declarativess = @declarativesfromlinkcat.search(params[:query]) #search for non tagged terms
							@declarativest = @declarativesfromlinkcat.tagged_with(params[:query]) #search for tagged terms
							@declaratives = @declarativess | @declarativest #remove duplicate declaratives
							

							#Labelling data for the search	
							
							@searchterm = params[:query]
							@topic = Linkcat.find(params[:q]).linkcatname
							
							@count = @declaratives.count
							@request = Docstructure.find(params[:queryid]).headingname
					end	
				else	#Topic only search
					
					#Set up the Declaratives that the user can search
							@user = current_user #identify current user
							@linkrel = Linkcat.where(released: true) 
							@decallowed = Declarative.where("linkcat_id = ? or user_id = ?", @linkrel[0], current_user.id).order(:linkcat_id).order(:docstructure_id).order(:sandbox).order(:created_at) #set up a list of the declaratives allowed to be accessed by the user
							@declarativesfromlinkcat = @decallowed.where("linkcat_id = ?", params[:q]) #Further reduce as this is only a heading search

							@declarativess = @declarativesfromlinkcat.search(params[:query]) #search for non tagged terms
							@declarativest = @declarativesfromlinkcat.tagged_with(params[:query]) #search for tagged terms
							@declaratives = @declarativess | @declarativest #remove duplicate declaratives
							

							#Labelling data for the search	
							
							@searchterm = params[:query]
							@topic = Linkcat.find(params[:q]).linkcatname
							
							@count = @declaratives.count
							@request = "All"
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

	    @declarative.sandbox = true
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

	
end
	
	private

	def declarative_params
		params.require(:declarative).permit(:urlsource, :declarativetext, :declarativejusttext, :user_id, :docstructure_id, :datapoint, :units, :entryhierarchy, :texttype, :entryend, :endsection, :linkcat_id, :user_id, :sandbox, :urlextra, :reviewdate)
	end	

	




