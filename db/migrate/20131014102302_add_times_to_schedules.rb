class AddTimesToSchedules < ActiveRecord::Migration
  def change
    add_column :schedules, :start_time, :timestamp
    add_column :schedules, :end_time, :timestamp
  end
end
