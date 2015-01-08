class Comment < ActiveRecord::Base
	belongs_to :user

	validates :contentcom, presence: true

	protected

  after_create do
    newcomment_mail
    
  end 

  def newcomment_mail
    CommentMailer.newcomment_mail(self).deliver
  end 

  
end
