class AdminMailer < Devise::Mailer
	default from: 'postmaster@m.minervasi.com'
  layout 'mailer'
  before_filter :add_inline_attachments!

  
  
	 helper :application # gives access to all helpers defined within `application_helper`.
  include Devise::Controllers::UrlHelpers # Optional. eg. `confirmation_url`
  default template_path: 'devise/mailer' # to make sure that you mailer uses the devise views

	def moreinfo_mail(moreinfo)
    @moreinfo = moreinfo
    @email=@moreinfo.email
    @url  = 'http://minervasi.co/login'
    mail(to: @moreinfo.email, subject: 'Minerva - Thankyou for agreeing to receive updates')
  end

  def awaiting_approval_mail(user)
    @user = user
    @fname = @user.fname
    @url  = 'http://minervasi.co/login'
    mail(to: @user.email, subject: 'Minerva Registration Process')
  end

  def sending_approval_mail(user)
    @user = user
    @fname = @user.fname
    @url  = 'http://minervasi.co/login'
    mail(to: @user.email, subject: 'Minerva Registration Approved')
  end
private
  def add_inline_attachments!
    attachments.inline['logo.svg'] =  File.read("#{Rails.root}/app/assets/images/logo.svg")
      
  end
  
end
