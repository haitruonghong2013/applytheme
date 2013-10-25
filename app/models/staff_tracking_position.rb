class StaffTrackingPosition < ActiveRecord::Base
  belongs_to :user
  belongs_to :schedule
  attr_accessible :latitude, :longitude, :schedule_id, :user_id
end
