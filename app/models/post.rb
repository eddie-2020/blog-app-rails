class Post < ApplicationRecord
  belongs_to :users, class_name: 'users', foreign_key: 'user_id'
  has_many :comments, class_name: 'comments'
  has_many :likes, class_name: 'likes'
end
