class Location < ActiveRecord::Base
  attr_accessible :address, :client_id, :latitue, :longtitue
end
