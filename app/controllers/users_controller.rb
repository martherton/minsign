class UsersController < ApplicationController
	before_filter :authenticate_user!


	def index
		# @user = User.order('approved')
		@users = policy_scope(User)

	end	

	def edit
		@user = User.find(params[:id])
	end	

	def update
		@user = User.find(params[:id])
		

		if @user.update(user_params)
        flash[:success] = "Updated!"
        
        # send approved mail
        if @user.update(approved: 'true')
        	
    				@user.send_reset_password_instructions
  
 							# Add to appropriate Mailchimp list
  	
    				
    					return true if (Rails.env.test? && !testing)
    					list_id = ENV['MAILCHIMP_MINERVA_LIST_ID']

    					response = Rails.configuration.mailchimp.lists.unsubscribe({
      				id: list_id,
				      email: {email: @user.email},
				      double_optin: false,
				      merge_vars: { :GROUPINGS => [{ :id =>"18233", :name => "Status of people", :groups => ['Signed up but unapproved']}] },
					    })

					    response = Rails.configuration.mailchimp.lists.subscribe({
					      id: list_id,
					      email: {email: @user.email},
					      double_optin: false,
					      merge_vars: { :GROUPINGS => [{ :id =>"18233", :name => "Status of people", :groups => ['Approved Current User']}] },
					    })
					    response
					  
					elsif @user.update(approved: 'false')

    				AdminMailer.sending_unapproval_mail(@user).deliver


				  	return true if (Rails.env.test? && !testing)
  					list_id = ENV['MAILCHIMP_MINERVA_LIST_ID']

  					response = Rails.configuration.mailchimp.lists.unsubscribe({
    				id: list_id,
			      email: {email: email},
			      double_optin: false,
			      merge_vars: { :GROUPINGS => [{ :id =>"18233", :name => "Status of people", :groups => ['Approved Current User']}] },
				    })

				    response = Rails.configuration.mailchimp.lists.subscribe({
				      id: list_id,
				      email: {email: email},
				      double_optin: false,
				      merge_vars: { :GROUPINGS => [{ :id =>"18233", :name => "Status of people", :groups => ['User who has left']}] },
				    })
				    response
				  end
				redirect_to users_path
      
    else
      flash[:error] = "Oops. There has been a problem, please retry."
      render :edit
    end
	end	

	

	private

	def user_params
		params.require(:user).permit(:email, :approved, :role_ids => [] )
	end	

	
end
