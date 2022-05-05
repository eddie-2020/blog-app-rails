require 'rails_helper'

RSpec.describe Like, type: :model do
  describe 'Like model' do
    like_queries { Like.new(author_id: 1) }

    before { like_queries.save }

    it 'should check if it increments the likes by 1' do
      prev_likes_counter = Post.find(1).likes_counter
      like_queries.update_likes_counter
      expect(Post.find(1).likes_counter).to eq(prev_likes_counter + 1)
    end
  end
end
