class Client < ActiveRecord::Base
  has_one :location, :dependent => :destroy
  has_many :users, :through => :client_notes
  belongs_to :user,:foreign_key => 'created_by'
  accepts_nested_attributes_for :location
  attr_accessible :location_attributes, :age, :city, :country, :email, :name, :phone, :sex
end
