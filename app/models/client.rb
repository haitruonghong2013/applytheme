class Client < ActiveRecord::Base
  has_one :location
  has_many :users, :through => :client_notes
  belongs_to :user,:foreign_key => 'created_by'
  attr_accessible :address, :age, :city, :country, :email, :name, :phone, :sex
end
