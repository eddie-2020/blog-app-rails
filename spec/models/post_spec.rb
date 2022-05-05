require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'Post model' do
    post_queries { Post.new(title: 'Post title', text: 'Post text', author_id: 1) }

    before { post_queries.save }

    it 'should increment the comments' do
      prev_posts_counter = User.find(1).posts_counter
      post_queries.update_posts_counter
      expect(User.find(1).post_queries).to eq(prev_posts_counter + 1)
    end

    it 'should check if the title is not blank' do
      post_queries.title = ''
      expect(post_queries).to_not be_valid
    end

    it 'should check if the title is more than the maximum characters: 250' do
      post_queries.title = 'Post title Post title Post title Post title Post title Post title Post title Post title Post title Post title
      Post title Post title Post title Post title Post title Post title Post title Post title Post title Post title Post title Post title
      Post title Post title Post title Post title Post title Post title Post title Post title Post title Post title Post title Post title'

      expect(post_queries).to_not be_valid
    end
  end
end
