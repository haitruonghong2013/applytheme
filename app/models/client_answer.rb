class ClientAnswer < ActiveRecord::Base
  attr_accessible :client_id, :content, :question_id
end
