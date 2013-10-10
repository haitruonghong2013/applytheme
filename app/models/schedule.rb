class Schedule < ActiveRecord::Base
  has_many :meetings
  belongs_to :own_user,:class_name => 'User', :foreign_key => 'created_by'
  belongs_to :user, :foreign_key => 'assigned_id'
  attr_accessible :working_hours_id, :assigned_id, :average_meeting_duration, :created_by, :ending_location_id, :hq_location_id, :schedule_date, :speed, :transport
end
