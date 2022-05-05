require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'User model' do
    user_queries { User.new(name: 'User name', photo: 'avatar.png', bio: 'User bio', posts_counter: 0) }

    before { user_queries.save }

    it 'should check if the name is blank' do
      user_queries.name = ''
      expect(user_queries).to_not be_valid
    end

    it 'should check if the posts_counter is numeric' do
      user_queries.posts_counter = 'Hello'
      expect(user_queries).to_not be_valid
    end

    it 'should check if the post counter is greater than or equal to zero' do
      expect(user_queries.posts_counter).to be >= 0
    end
  end
end
