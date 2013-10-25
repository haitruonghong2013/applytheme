class AddMeetingIdToClientNotes < ActiveRecord::Migration
  def change
    add_column :clients, :meeting_id, :integer
  end
end
