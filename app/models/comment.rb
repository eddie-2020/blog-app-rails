class Comment < ApplicationRecord
  belongs_to :users, class_name: 'users'
  belongs_to :posts, class_name: 'posts'
end
