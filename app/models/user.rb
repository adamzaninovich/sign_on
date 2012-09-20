class User < ActiveRecord::Base
  attr_accessible :name, :username, :email, :password, :password_confirmation
  validates_presence_of :password, on: :create
  validates :email, presence: true, format: { with: /@/, message: "is invalid" }
  has_secure_password
end
