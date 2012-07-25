class Comment < ActiveRecord::Base
  attr_accessible :content
  belongs_to :commentable, :polymorphic => true
  validates :user_id, presence: true
  validates :post_id, presence: true
  validates :content, presence: true, length: { maximum: 200 }
end
