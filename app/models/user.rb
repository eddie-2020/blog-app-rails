class User < ApplicationRecord
  has_many :posts, class_name: 'posts', foreign_key: 'user_id'
  has_many :comments, class_name: 'comments', foreign_key: 'user_id'
  has_many :likes, class_name: 'likes', foreign_key: 'user_id'
end
