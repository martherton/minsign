class DeclarativesController < ApplicationController




	def new

		if current_user.has_role? :sandbox or :admin
			@user = current_user
    	@declarative = @user.declaratives.new
    	if params[:q].present?
    		@declarative.declarativejusttext = params[:q]
    	else
    	end	
    	@linkcat = Linkcat.where("linkcattype = ?","Information")
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
		if current_user.has_role :sandbox #Limit the amount of items a free user can input
			if Declarative.where(created_at: (Time.now - 1.month)..Time.now).where(user_id: current_user.id).count > 500
				flash[:failure] = "This month's limit has been reached, please upgrade if you require more space"
				redirect_to new_user_declarative_path
			else	
			end
		else
		end	
				
		if current_user.has_role? :admin or :sandbox
				
		    @user = current_user
		    @declarative = @user.declaratives.new(declarative_params)
		    @declarative.sandbox = true
		    if @declarative.save
		    	flash[:success] = "Data Entry Successfully Added"
		    		redirect_to new_user_declarative_path
		    	
		  	else
		  		flash[:error] = "Check your input"
		    	redirect_to new_user_declarative_path(current_user.id, q: @declarative.declarativejusttext)
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
							@linkrel = @user.linkcats.map(&:id) #This allows content we have allowed in the user package 
							@friends1 = @user.inverse_friendships.map(&:user_id) | @user.friendships.map(&:friend_id) #find all friends
							@friendsun = @user.friendships.where(approved: nil).map(&:friend_id) #remove unapproved friends
							@friends = @friends1 - @friendsun
							@admins = Role.find_by_name('admin').users.map(&:id) #find admin users
							@linkcatun = Linkcat.where("released = ?", false).map(&:id) #find all unreleased linkcats
							@decallowed = Declarative.where("(linkcat_id IN (?) AND user_id IN(?)) or user_id IN (?) or user_id = ?", @linkrel, @admin, @friends, current_user.id).order(:linkcat_id).order(:docstructure_id).order(:sandbox).order(:created_at) #set up a list of the declaratives allowed to be accessed by the user
							if current_user.has_role? :admin #Ensures admin sandbox posts are not removed if you are admin
								@decallowed3 = @decallowed
							else	
								@decallowed2 = @decallowed.where.not("user_id IN (?) AND sandbox = ?", @admins, true) #removes admin sandbox
								@decallowed3 = @decallowed2.where.not("user_id IN (?) AND linkcat_id IN (?)", @admins, @linkcatun) #remove content from unreleased topics that have an admin creator
							end	
							
							@declarativesfromlinkcat = @decallowed3.where(:docstructure_id => params[:queryid]) #Further reduce as this is only a heading search
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
							@linkrel = @user.linkcats.map(&:id)
							@friends1 = @user.inverse_friendships.map(&:user_id) | @user.friendships.map(&:friend_id)
							@friendsun = @user.friendships.where(approved: nil).map(&:friend_id) #remove unapproved friends
							@friends = @friends1 - @friendsun
							@admins = Role.find_by_name('admin').users.map(&:id)
							@linkcatun = Linkcat.where("released = ?", false).map(&:id) #find all unreleased linkcats
							
							@decallowed = Declarative.where("(linkcat_id IN (?) AND user_id IN(?)) or user_id IN (?) or user_id = ?", @linkrel, @admin, @friends, current_user.id).order(:linkcat_id).order(:docstructure_id).order(:sandbox).order(:created_at) #set up a list of the declaratives allowed to be accessed by the user
							if current_user.has_role? :admin #Ensures admin sandbox posts are not removed if you are admin
								@decallowed3 = @decallowed
							else	
								@decallowed2 = @decallowed.where.not("user_id IN (?) AND sandbox = ?", @admins, true) #removes admin sandbox
								@decallowed3 = @decallowed2.where.not("user_id IN (?) AND linkcat_id IN (?)", @admins, @linkcatun) #remove content from unreleased topics that have an admin creator
							end	
							
							@declarativesfromlinkcat = @decallowed3.where(:docstructure_id => params[:queryid]) #Further reduce as this is only a heading search
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
							@linkrel = @user.linkcats.map(&:id)
							@friends1 = @user.inverse_friendships.map(&:user_id) | @user.friendships.map(&:friend_id)
							@friendsun = @user.friendships.where(approved: nil).map(&:friend_id) #remove unapproved friends
							@friends = @friends1 - @friendsun
							@admins = Role.find_by_name('admin').users.map(&:id)
							@linkcatun = Linkcat.where("released = ?", false).map(&:id) #find all unreleased linkcats
							
							@decallowed = Declarative.where("(linkcat_id IN (?) AND user_id IN(?)) or user_id IN (?) or user_id = ?", @linkrel, @admin, @friends, current_user.id).order(:linkcat_id).order(:docstructure_id).order(:sandbox).order(:created_at) #set up a list of the declaratives allowed to be accessed by the user
							if current_user.has_role? :admin #Ensures admin sandbox posts are not removed if you are admin
								@decallowed3 = @decallowed
							else	
								@decallowed2 = @decallowed.where.not("user_id IN (?) AND sandbox = ?", @admins, true) #removes admin sandbox
								@decallowed3 = @decallowed2.where.not("user_id IN (?) AND linkcat_id IN (?)", @admins, @linkcatun) #remove content from unreleased topics that have an admin creator
							end	
							
							@declarativesfromlinkcat = @decallowed3
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
							@linkrel = @user.linkcats.map(&:id)
							@friends1 = @user.inverse_friendships.map(&:user_id) | @user.friendships.map(&:friend_id)
							@friendsun = @user.friendships.where(approved: nil).map(&:friend_id) #remove unapproved friends
							@friends = @friends1 - @friendsun
							@admins = Role.find_by_name('admin').users.map(&:id)
							@linkcatun = Linkcat.where("released = ?", false).map(&:id) #find all unreleased linkcats
							
							@decallowed = Declarative.where("(linkcat_id IN (?) AND user_id IN(?)) or user_id IN (?) or user_id = ?", @linkrel, @admin, @friends, current_user.id).order(:linkcat_id).order(:docstructure_id).order(:sandbox).order(:created_at) #set up a list of the declaratives allowed to be accessed by the user
							if current_user.has_role? :admin #Ensures admin sandbox posts are not removed if you are admin
								@decallowed3 = @decallowed
							else	
								@decallowed2 = @decallowed.where.not("user_id IN (?) AND sandbox = ?", @admins, true) #removes admin sandbox
								@decallowed3 = @decallowed2.where.not("user_id IN (?) AND linkcat_id IN (?)", @admins, @linkcatun) #remove content from unreleased topics that have an admin creator
							end	
							
							@declarativesfromlinkcat = @decallowed3.where("docstructure_id = ? AND linkcat_id = ?", params[:queryid], params[:q]) #Further reduce as this is only a heading search

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
							@linkrel = @user.linkcats.map(&:id)
							@friends1 = @user.inverse_friendships.map(&:user_id) | @user.friendships.map(&:friend_id)
							@friendsun = @user.friendships.where(approved: nil).map(&:friend_id) #remove unapproved friends
							@friends = @friends1 - @friendsun
							@admins = Role.find_by_name('admin').users.map(&:id)
							@linkcatun = Linkcat.where("released = ?", false).map(&:id) #find all unreleased linkcats
							
							@decallowed = Declarative.where("(linkcat_id IN (?) AND user_id IN(?)) or user_id IN (?) or user_id = ?", @linkrel, @admin, @friends, current_user.id).order(:linkcat_id).order(:docstructure_id).order(:sandbox).order(:created_at) #set up a list of the declaratives allowed to be accessed by the user
							if current_user.has_role? :admin #Ensures admin sandbox posts are not removed if you are admin
								@decallowed3 = @decallowed
							else	
								@decallowed2 = @decallowed.where.not("user_id IN (?) AND sandbox = ?", @admins, true) #removes admin sandbox
								@decallowed3 = @decallowed2.where.not("user_id IN (?) AND linkcat_id IN (?)", @admins, @linkcatun) #remove content from unreleased topics that have an admin creator
							end	
							
							@declarativesfromlinkcat = @decallowed3.where("docstructure_id = ? AND linkcat_id = ?", params[:queryid], params[:q]) #Further reduce as this is only a heading search

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
							@linkrel = @user.linkcats.map(&:id)
							@friends1 = @user.inverse_friendships.map(&:user_id) | @user.friendships.map(&:friend_id)
							@friendsun = @user.friendships.where(approved: nil).map(&:friend_id) #remove unapproved friends
							@friends = @friends1 - @friendsun
							@admins = Role.find_by_name('admin').users.map(&:id)
							@linkcatun = Linkcat.where("released = ?", false).map(&:id) #find all unreleased linkcats
							
							@decallowed = Declarative.where("(linkcat_id IN (?) AND user_id IN(?)) or user_id IN (?) or user_id = ?", @linkrel, @admin, @friends, current_user.id).order(:linkcat_id).order(:docstructure_id).order(:sandbox).order(:created_at) #set up a list of the declaratives allowed to be accessed by the user
							if current_user.has_role? :admin #Ensures admin sandbox posts are not removed if you are admin
								@decallowed3 = @decallowed
							else	
								@decallowed2 = @decallowed.where.not("user_id IN (?) AND sandbox = ?", @admins, true) #removes admin sandbox
								@decallowed3 = @decallowed2.where.not("user_id IN (?) AND linkcat_id IN (?)", @admins, @linkcatun) #remove content from unreleased topics that have an admin creator
							end	
							
							

							@declaratives = @decallowed3.where("linkcat_id = ?", params[:q])
							
							

							#Labelling data for the search	
							
							@searchterm = params[:query]
							@topic = Linkcat.find(params[:q]).linkcatname
							if @declaratives.nil?
								@count = 0
							else	
								@count = @declaratives.count
							end	
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
	        flash[:success] = "Your note was updated"
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

	




