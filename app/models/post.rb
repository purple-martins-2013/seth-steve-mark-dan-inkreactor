class Post < ActiveRecord::Base
  validates_presence_of :subject, :content

end
