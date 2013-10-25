class ClientAnswer < ActiveRecord::Base
  belongs_to :client
  belongs_to :question
  attr_accessible :client_id, :content, :question_id
end
