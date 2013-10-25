class CreateMajorVarianceLogs < ActiveRecord::Migration
  def change
    create_table :major_variance_logs do |t|
      t.integer :meeting_id
      t.datetime :datetime
      t.integer :variance
      t.float :latitude
      t.float :longitude
      t.integer :created_by

      t.timestamps
    end
  end
end
