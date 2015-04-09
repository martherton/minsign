class User < ActiveRecord::Base
  rolify
  after_create :assign_default_role #adds the default user role
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable, :lockable

  has_and_belongs_to_many :linkcats
  has_many :wlinks
  has_many :drafts
  has_many :finds 
  has_many :comments 
  has_many :docstructures
  has_many :declaratives
  has_many :friendships
  has_many :friends, through: :friendships
  has_many :inverse_friendships, class_name: "Friendship", foreign_key: "friend_id"
  has_many :inverse_friends, through: :inverse_friendships, source: :user 
  

  

  validates :email, presence: true, uniqueness: true
  validates :fname, presence: true
  validates :lname, presence: true
  validates :company, presence: true
  validates :position, presence: true     

	#method after a registration
	after_create do
    subscribe_to_mailchimp_unapproved
  end

  #Mailing after confirm

  def after_confirmation
    AdminMailer.awaiting_approval_mail(self).deliver
  end

  

 # Add to appropriate Mailchimp list
  def subscribe_to_mailchimp_unapproved testing=false
    if @emailinfo.nil?
    return true if (Rails.env.test? && !testing)
    list_id = ENV['MAILCHIMP_MINERVA_LIST_ID']

    response = Rails.configuration.mailchimp.lists.subscribe({
      id: list_id,
      email: {email: email},
      double_optin: false,
      merge_vars: { :GROUPINGS => [{ :id =>"18233", :name => "Status of people", :groups => ['Signed up but unapproved']}] },
    })
    response
    end
  end

# Allow sign up without password

  def password_required?
        super if confirmed?
  end

  def password_match?
        self.errors[:password] << "can't be blank" if password.blank?
        self.errors[:password_confirmation] << "can't be blank" if password_confirmation.blank?
        self.errors[:password_confirmation] << "does not match password" if password != password_confirmation
        password == password_confirmation && !password.blank?
  end

  # Adds a base user role as the de minimis setting for the sign up.

  def assign_default_role
    add_role(:user)
  end



  
end
