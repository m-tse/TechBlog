class Comment < ActiveRecord::Base
  attr_accessible :content, :post_id
  belongs_to :user
  has_one :post
  validates :user_id, presence: true
  validates :post_id, presence: true
  validates :content, presence: true, length: { maximum: 200 }
end
