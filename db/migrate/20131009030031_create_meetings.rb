class CreateMeetings < ActiveRecord::Migration
  def change
    create_table :meetings do |t|
      t.integer :client_id
      t.integer :user_id
      t.datetime :meeting_time
      t.integer :meeting_duration
      t.string :status
      t.integer :schedule_id
      t.integer :created_by

      t.timestamps
    end
  end
end
