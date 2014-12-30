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
	  list_id = ENV['MAILCHIMP_MINERVA_LIST_ID']

	  response = Rails.configuration.mailchimp.lists.subscribe({
	    id: list_id,
	    email: {email: email},
	    double_optin: false,
	    merge_vars: { :GROUPINGS => [{ :id =>"18233", :name => "Status of people", :groups => ['More Information']}] },
	  })
	  response
	end
end
