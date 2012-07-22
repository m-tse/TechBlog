class User < ActiveRecord::Base
  attr_accessible :name, :password, :email, :password_confirmation
  has_secure_password
  has_many :posts

  before_save :create_remember_token
  before_save { |user| user.email = email.downcase }

  validates :name, presence: true, length: { maximum: 50}
  validates :password, presence: true
  validates :password_confirmation, presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, 
  uniqueness: { case_sensitive: false }



  private

  def create_remember_token
    self.remember_token = SecureRandom.urlsafe_base64
  end
end
