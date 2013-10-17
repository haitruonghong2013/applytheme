class PushNotification < ActiveRecord::Base
  belongs_to :user
  attr_accessible :user_id,:device_id, :notif, :reminder_for_next_meeting,
                  :reminder_for_take_note, :time_reminder_befor_meeting
end
