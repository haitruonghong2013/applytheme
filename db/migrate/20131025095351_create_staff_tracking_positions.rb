class CreateStaffTrackingPositions < ActiveRecord::Migration
  def change
    create_table :staff_tracking_positions do |t|
      t.integer :user_id
      t.integer :schedule_id
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
