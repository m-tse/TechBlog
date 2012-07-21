class User < ActiveRecord::Base
  attr_accessible :name, :password
  has_secure_password

  validates :name, presence: true
  validates :password, presence: true
end
