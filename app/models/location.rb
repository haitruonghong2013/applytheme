class Location < ActiveRecord::Base
  belongs_to :client
  attr_accessible :address, :client_id, :latitue, :longtitue
end
