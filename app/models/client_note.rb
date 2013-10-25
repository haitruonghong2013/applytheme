class ClientNote < ActiveRecord::Base
  belongs_to :user
  belongs_to :client
  belongs_to :meeting
  attr_accessible :client_id, :note_content, :user_id
end
