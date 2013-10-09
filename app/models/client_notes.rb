class ClientNotes < ActiveRecord::Base
  attr_accessible :client_id, :note_content, :user_id
end
