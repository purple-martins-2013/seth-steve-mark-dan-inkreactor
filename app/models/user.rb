class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates_presence_of :username

  validates :email, format: { with: /.{1,}@.{1,}\..{1,}/,
    message: "must be a valid email address"}

  has_many :post
  has_many :comments

end
