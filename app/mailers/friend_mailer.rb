class FriendMailer < ApplicationMailer
	default from: 'postmaster@m.minervasi.com'
	 helper :application # gives access to all helpers defined within `application_helper`.
  include Devise::Controllers::UrlHelpers # Optional. eg. `confirmation_url`
  default template_path: 'devise/mailer' # to make sure that you mailer uses the devise views
  layout 'mailer'
  before_filter :add_inline_attachments!

	def friend_request(friend)
    
    @sendemail = User.find(friend.user_id).email
    @friendfname = User.find(friend.friend_id).fname
    @sendlname = User.find(friend.user_id).lname
    @sendfname = User.find(friend.user_id).fname

    @url  = 'http://minervasi.co/login'
    mail(to: User.find(friend.friend_id).email, subject: 'Minerva friend request')
  end

  private
  def add_inline_attachments!
    attachments.inline['logo.svg'] = {mime_type: 'image/png',
       content: File.read("#{Rails.root}/app/assets/images/logo.png")
      }
      
  end
end
