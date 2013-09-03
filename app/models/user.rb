class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates_presence_of :username

  validates :email, format: { with: /.{1,}@.{1,}\..{1,}/,
    message: "must be a valid email address"}

  has_many :posts
  has_many :comments

end
