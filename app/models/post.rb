class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :likes

  validates :title, presence: true, length: { maximum: 250 }
  validates :comments_counter, numericality: { integer: true, greater_than_or_equal_to: 0 }
  validates :likes_counter, numericality: { integer: true, greater_than_or_equal_to: 0 }

  def update_users_posts_counter
    user.increment!(:post_counter)
  end

  def most_recent_comments
    comments.order(created_at: :desc).limit(5)
  end
end
