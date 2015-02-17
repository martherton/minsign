class CommentMailer < ApplicationMailer
	default from: 'comment@m.minervasi.com'
	 helper :application # gives access to all helpers defined within `application_helper`.
  include Devise::Controllers::UrlHelpers # Optional. eg. `confirmation_url`
  default template_path: 'devise/mailer' # to make sure that you mailer uses the devise views

	def newcomment_mail(comment)
    @comment = comment.contentcom
    @email = User.find(comment.user_id).email
    @fname = User.find(comment.user_id).fname
    @lname = User.find(comment.user_id).lname
    @url  = 'http://minervasi.co/login'
    mail(to: ["request@minervasi.com"], subject: 'User comment')
  end
end
