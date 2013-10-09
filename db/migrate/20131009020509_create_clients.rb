class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :name
      t.string :phone
      t.string :email
      t.string :country
      t.string :city
      t.string :address
      t.integer :age
      t.integer :sex
      t.integer :organization_id
      t.integer :created_by
      t.timestamps
    end
  end
end
