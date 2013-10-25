class Meeting < ActiveRecord::Base
  has_many :client_notes
  has_one :major_variance_log
  belongs_to :schedule
  belongs_to :user
  belongs_to :owner_user, :class_name => 'User', :foreign_key => 'created_by'
  belongs_to :client
  attr_accessible :client_id, :created_by, :meeting_duration, :meeting_time, :schedule_id, :status, :user_id
end
