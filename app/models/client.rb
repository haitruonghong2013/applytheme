class Client < ActiveRecord::Base
  attr_accessible :address, :age, :city, :country, :email, :name, :phone, :sex
end
