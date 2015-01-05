class AdminMailer < Devise::Mailer
	default from: 'postmaster@m.minervasi.com'
	 helper :application # gives access to all helpers defined within `application_helper`.
  include Devise::Controllers::UrlHelpers # Optional. eg. `confirmation_url`
  default template_path: 'devise/mailer' # to make sure that you mailer uses the devise views

	def moreinfo_mail(moreinfo)
    @moreinfo = moreinfo
    @url  = 'http://minervasi.co/login'
    mail(to: @moreinfo.email, subject: 'MinervaSI sign up for updates')
  end

  def awaiting_approval_mail(user)
    @user = user
    @url  = 'http://minervasi.co/login'
    mail(to: @user.email, subject: 'MinervaSI approval process')
  end

  def sending_approval_mail(user)
    @user = user
    @url  = 'http://minervasi.co/login'
    mail(to: @user.email, subject: 'MinervaSI approved')
  end

  
end
