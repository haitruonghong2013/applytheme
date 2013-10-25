class StaffTrackingPosition < ActiveRecord::Base
  attr_accessible :latitude, :longitude, :schedule_id, :user_id
end
