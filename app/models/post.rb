class Post < ActiveRecord::Base
  CONTENT_MAX_LENGTH = 8000
  SUBJECT_MAX_LENGTH = 50
  PER_PAGE = 25

  validates :subject, :content, :presence => true

  belongs_to :user
  has_many :comments
  has_and_belongs_to_many :tags
  validates_length_of :content, maximum: CONTENT_MAX_LENGTH
  validates_length_of :subject, maximum: SUBJECT_MAX_LENGTH

  def owner? user
    self.user == user
  end
end
