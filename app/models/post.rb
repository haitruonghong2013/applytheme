class Post < ActiveRecord::Base
  #rolify
  attr_accessible :content, :title
end
