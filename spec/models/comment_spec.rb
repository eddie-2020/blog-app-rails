require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'Comment model' do
    comment_queries { User.create(name: 'User name', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Users bio text') }
    comment_queries { Post.new(author_id: 1, title: 'Post title', text: 'Post text') }
    comment_queries { Comment.new(text: 'Comment text', author_id: 1) }

    before { comment_queries.save }

    it 'should check if it increments the comments by 1' do
      prev_comments_counter = Post.find(1).comments_counter
      comment_queries.update_comments_counter
      expect(Post.find(1).comments_counter).to eq(prev_comments_counter + 1)
    end
  end
end
