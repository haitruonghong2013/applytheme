class Schedule < ActiveRecord::Base
  attr_accessible :am_working_hours_id, :assigned_id, :average_meeting_duration, :created_by, :ending_location_id, :hq_location_id, :pm_working_hours_id, :schedule_date, :speed, :transport
end
