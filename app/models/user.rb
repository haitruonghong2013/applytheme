class User < ActiveRecord::Base
  rolify
  before_save :ensure_authentication_token

  has_many :clients, :through => :client_notes
  has_many :owner_clients, :class_name => 'Client', :foreign_key => 'created_by'
  has_many :owner_users, :class_name => 'User', :foreign_key => 'created_by'
  has_many :owner_meetings, :class_name => 'Meeting', :foreign_key => 'created_by'
  has_many :owner_major_logs, :class_name => 'MajorVarianceLog', :foreign_key => 'created_by'
  has_many :meetings
  has_many :schedules, :foreign_key => 'assigned_id'
  has_many :own_schedules, :class_name => 'Schedule', :foreign_key => 'created_by'
  has_many :push_notifications, :dependent => :destroy
  belongs_to :organization

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :timeoutable,
         :token_authenticatable,
         :authentication_keys => [:login]


  # Virtual attribute for authenticating by either username or email
  # This is in addition to a real persisted field like 'username'
  attr_accessor :login
  attr_accessible :login
  # Setup accessible (or protected) attributes for your model
  attr_accessor :current_password
  attr_accessible :role_ids, :current_password
  attr_accessible :username, :email, :password, :password_confirmation, :remember_me
  # attr_accessible :title, :body

  validates :username, :presence => true, :uniqueness => {:case_sensitive => false,:message =>'user name is existing!'}

  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions).where(["lower(username) = :value OR lower(email) = :value", {:value => login.downcase}]).first
    else
      where(conditions).first
    end
  end

### This is the correct method you override with the code above
### def self.find_for_database_authentication(warden_conditions)
### end
end
