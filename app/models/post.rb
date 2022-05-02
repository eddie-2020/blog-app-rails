class Post < ApplicationRecord
  belongs_to :users
  has_many :comments
  has_many :likes

  def five_most_recent_comments
    comments.order(created_at: :desc).limit(5)
  end

  after_save :update_posts_counter

  private

  def update_posts_counter
    users.increment!(:update_posts_counter)
  end
end
