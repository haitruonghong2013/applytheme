class CreateClientNotes < ActiveRecord::Migration
  def change
    create_table :client_notes do |t|
      t.integer :client_id
      t.integer :user_id
      t.text :note_content
      t.timestamps
    end
  end
end
