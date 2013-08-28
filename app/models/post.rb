class Post < ActiveRecord::Base
  validates_presence_of :subject, :content
  belongs_to :user
  has_many :comments

end
