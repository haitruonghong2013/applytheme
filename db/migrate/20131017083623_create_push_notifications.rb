class CreatePushNotifications < ActiveRecord::Migration
  def change
    create_table :push_notifications do |t|
      t.string :device_id
      t.boolean :notif
      t.boolean :reminder_for_next_meeting
      t.string :time_reminder_befor_meeting
      t.boolean :reminder_for_take_note
      t.integer :user_id

      t.timestamps
    end
  end
end
