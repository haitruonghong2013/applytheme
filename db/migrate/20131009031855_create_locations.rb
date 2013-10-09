class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :address
      t.string :longtitue
      t.string :latitue
      t.integer :client_id

      t.timestamps
    end
  end
end
