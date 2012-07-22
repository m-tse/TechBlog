class Post < ActiveRecord::Base
  attr_accessible :content, :title
  validates :user_id, presence: true
  validates :content, presence: true
  validates :title, presence:true
  belongs_to :user
  default_scope order: 'posts.created_at DESC'
end
