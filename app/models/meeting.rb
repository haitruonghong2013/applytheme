class Meeting < ActiveRecord::Base
  attr_accessible :client_id, :created_by, :meeting_duration, :meeting_time, :schedule_id, :status, :user_id
end
