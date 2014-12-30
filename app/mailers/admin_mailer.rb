class AdminMailer < ApplicationMailer
	default from: 'postmaster@m.minervasi.com'
	

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
end
