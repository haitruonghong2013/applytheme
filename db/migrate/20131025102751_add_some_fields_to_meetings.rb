class AddSomeFieldsToMeetings < ActiveRecord::Migration
  def change
    add_column :meetings, :travel_time, :integer
    add_column :meetings, :real_meeting_time, :datetime
    add_column :meetings, :real_travel_time, :integer
  end
end
