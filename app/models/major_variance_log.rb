class MajorVarianceLog < ActiveRecord::Base
  belongs_to :meeting
  belongs_to :owner_user, :class_name => 'User', :foreign_key => 'created_by'
  attr_accessible :created_by, :datetime, :latitude, :longitude, :meeting_id, :variance
end
