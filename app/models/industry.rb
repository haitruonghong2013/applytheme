class Industry < ActiveRecord::Base
  has_many :questions
  has_many :clients
  attr_accessible :description, :name
end
