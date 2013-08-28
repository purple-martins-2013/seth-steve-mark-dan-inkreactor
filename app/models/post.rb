class Post < ActiveRecord::Base
  validates_presence_of :subject, :content
  validates_length_of :content, maximum: 8000
  validates_length_of :subject, maximum: 50
  
end
