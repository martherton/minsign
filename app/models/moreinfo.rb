class Moreinfo < ActiveRecord::Base
	validates :email, presence: true, uniqueness: true

	protected

  after_create do
    moreinfo_mail
    subscribe_to_mailchimp_update
  end 

  def moreinfo_mail
    AdminMailer.moreinfo_mail(self).deliver
  end 

  def subscribe_to_mailchimp_update testing=false
	  return true if (Rails.env.test? && !testing)
	  list_id = ENV['MAILCHIMP_LIST_ID2']

	  response = Rails.configuration.mailchimp.lists.subscribe({
	    id: list_id,
	    email: {email: email},
	    double_optin: false,
	    
	  })
	  response
	end
end
