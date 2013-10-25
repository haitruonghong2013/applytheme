class Question < ActiveRecord::Base
  has_many :client_answers
  belongs_to :industry
  attr_accessible :content, :created_by, :title
end
