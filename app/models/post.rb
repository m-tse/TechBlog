class Post < ActiveRecord::Base
  attr_accessible :content, :title, :photo
  validates :user_id, presence: true
  validates :content, presence: true
  validates :title, presence: true
  belongs_to :user
  has_many :comments
  has_attached_file :photo,
    :storage => :s3,
  :s3_credentials => {
    :bucket  => ENV['S3_BUCKET_NAME'],
    :access_key_id => ENV['AWS_ACCESS_KEY_ID'],
    :secret_access_key => ENV['AWS_SECRET_ACCESS_KEY']
  }
  default_scope order: 'posts.created_at DESC'
end
