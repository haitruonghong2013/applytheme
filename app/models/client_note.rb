class ClientNote < ActiveRecord::Base
  belongs_to :user
  belongs_to :client
  attr_accessible :client_id, :note_content, :user_id
end
