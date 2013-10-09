class CreateSchedules < ActiveRecord::Migration
  def change
    create_table :schedules do |t|
      t.integer :am_working_hours_id
      t.integer :pm_working_hours_id
      t.integer :average_meeting_duration
      t.string :transport
      t.integer :speed
      t.integer :hq_location_id
      t.integer :ending_location_id
      t.integer :created_by
      t.integer :assigned_id
      t.datetime :schedule_date

      t.timestamps
    end
  end
end
