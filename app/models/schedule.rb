class Schedule < ActiveRecord::Base
  has_many :meetings, :dependent => :destroy
  belongs_to :own_user,:class_name => 'User', :foreign_key => 'created_by'
  belongs_to :user, :foreign_key => 'assigned_id'
  accepts_nested_attributes_for :meetings
  attr_accessible :meetings_attributes,:assigned_id, :average_meeting_duration, :created_by, :ending_location_id,
                  :hq_location_id, :schedule_date, :speed, :transport,:start_time, :end_time
end
