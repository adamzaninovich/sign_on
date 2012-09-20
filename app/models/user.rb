class User < ActiveRecord::Base
  validates_presence_of :password, on: :create
  validates :email, presence: true, format: { with: /@/, message: "is invalid" }
  has_secure_password
end
