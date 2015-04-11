class DraftsController < ApplicationController
	before_filter :authenticate_user!
	before_filter :find_tags, only: [:new, :create, :edit, :update]
	layout 'users/declaratives'
	def index
		@drafts = Draft.all

	end	

	def new
		@user = current_user
    	@draft = @user.drafts.new
    	@draft.build_meeting
    	@draft.build_webpage
    	@draft.build_book
    	@draft.build_brainstorm
    	@draft.build_otherpublication
    	@draft.build_lecture
		@draft.save
		redirect_to edit_user_draft_path(current_user.id, @draft.id)

	end	

	def update
		@user = current_user
	  @draft = @user.drafts.find(params[:id])
	  @draft.update(draft_params)
	  redirect_to edit_user_draft_path(current_user.id, @draft.id)
	end	

	def edit
		@user = current_user
		@draft = @user.drafts.find(params[:id])
		@meeting = @draft.meeting
		@webpage = @draft.webpage
		@book = @draft.book
		@brainstorm = @draft.brainstorm
		@otherpublication = @draft.otherpublication
		@lecture = @draft.lecture
	  @topic = Linkcat.where(:linkcattype => "Information")
	  
    	@linkcat = @user.linkcats.new
		@data = Openlibrary::Data

    	
	end	



	def images
		@images = Image.where("draft_id = ?", params[:id])
		redirect_to edit_user_draft_path(current_user.id, params[:id])
	end	

	

	def tags
	  tag1 = Declarative.all_tag_counts.by_tag_name(params[:q]).token_input_tags
	  tag2 = Wlink.all_tag_counts.by_tag_name(params[:q]).token_input_tags
	 
	  tagsa = tag1 | tag2
	  tags = []
	  tagsa.each do |tag|
	  	tags = tags.push(tag[:id])
	  end	
	  respond_to do |format|
    	format.json { render json: tags } 
  	end
  end	

  def headings
  	@heading = Docstructure.all
  	@headings = @heading.collect { |d| d.headingname }
  end	

  def processdraft
  	@stringsplit = []
  	@draftfull = Draft.find(params[:id])
  	@topi = Linkcat.find(@draftfull.linkcat_id)
  	@topic = @topi.linkcatname
  	@draft = @draftfull.draftnotes
    @images = Image.where("draft_id = ?", params[:id]).order(created_at: :desc)
  	@stringsplit = @draft.lines
  	@ss2 = []
  	@stringsplit.each do |split|
  		if split.first == "@"
  			@heading = split
  		else
  				@ss2 = @ss2.push([@heading,split])
  		end	
  		
  	end		

  	

  end	

  def processdraftf
  	@stringsplit = []
  	@draftfull = Draft.find(params[:id])
  	@topi = Linkcat.find(@draftfull.linkcat_id)
  	@topic = @topi.linkcatname
  	@draft = @draftfull.draftnotes
  	@dates = []
    @images = Image.where("draft_id = ?", params[:id]).order(created_at: :desc)

  	@stringsplit = @draft.lines
  	@ss2 = []
  	@stringsplit.each do |split|
  		if split.first == "@"
  			@heading = split
  		else
  				@ss2 = @ss2.push([@heading,split])
  		end	
  		
  	end		
    @count3 = 0
  	@decnum = @ss2.count
  	@ss2.each do |split|
      @count3 = @count3 + 1
  		@head = split[0].remove("@")
  		@head = @head.remove("\r\n")
  		@head = @head.squish
      @issues = "Issue#{@count3}"
      @issue2 = params[@issues]
      if @issue2.blank?
        @issue2 = 0
      else
        @issue2 = 1  
      end
  		if Docstructure.find_by("headingname = ?", @head).nil?
  		
  			@doc = Docstructure.new(:headingname => @head, :user_id => current_user.id, :sandbox => true, :released => false, :liveissue => @issue2, :draft_id => params[:id])	
        @doc.save
  		else	
  		end	

  	end	
  	@count2 = 0

  	@ss2.each do |split|
  		@count2 = @count2 + 1
  		@head = split[0].remove("@")
  		@head = @head.remove("\r\n")
  		@head = @head.squish
  		@docid = Docstructure.find_by("headingname = ?", @head)
  		@docids = @docid.id
  		@dater = "Test#{@count2}"
  		@dater2 = params[@dater]
      if @dater2.blank?
        @date = Date.today
      else
  		  @date = DateTime.strptime(@dater2, "%m/%d/%Y")
      end  
  		
  		if Declarative.find_by("declarativejusttext = ?", split[1]).nil?
  			@dec = Declarative.new(declarativejusttext: split[1], docstructure_id: @docids, linkcat_id: @topi.id, draft_id: params[:id], urlsource: :nil, declarativetext: :nil, datapoint: :nil, units: :nil, entryhierarchy: :nil, texttype: :nil, entryend: :nil, endsection: :nil, :sandbox => true, urlextra: :nil, reviewdate: @date, listtext: :nil, user_id: current_user.id)
  			@dec.save
  		else
  		end	
  	end

    @count4 = 0
    @images.each do |image|
      @count4 = @count4 + 1
      @taggings = "Imag#{@count4}"
      @taggings2 = params[@taggings]
      if @taggings2.blank?
      else  
        image.tag_list = @taggings2
      end  
    end 

  	@draftfull.update(processed: true)
  	redirect_to edit_user_draft_path(current_user.id, params[:id])
  end	

	private

	def draft_params
		params.require(:draft).permit(:sourcetype, :draftnotes, :topic, :currentissue, :processed, :title, :linkcat_id, :tag_list_tokens, images_attributes: [:id, :avatar, :tag_list, :draft_id, :destroy], book_attributes: [:id, :author, :title, :ISBN, :goodreads, :destoy], brainstorm_attributes: [:id, :name, :destroy], lecture_attributes: [:id, :lecturer, :lecturetitle, :lecturedate, :destroy], meeting_attributes: [:id, :meetingwith, :meetingtopic, :draft_id, :destroy], otherpublication_attributes: [:id, :publicationtitle, :article, :destroy], webpage_attributes: [:id, :urlused, :destroy], declaratives_attributes: [:id, :urlsource, :declarativetext, :declarativejusttext, :user_id, :docstructure_id, :datapoint, :units, :entryhierarchy, :texttype, :entryend, :endsection, :linkcat_id, :user_id, :sandbox, :urlextra, :reviewdate, :listtext, :draft_id], docstructures_attributes: [:id, :headingname, :user_id, :sandbox, :liveissue, :draft_id, :released])
	end	

	def find_tags
		
	end
end
