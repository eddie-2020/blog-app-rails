require 'rails_helper'

RSpec.describe 'posts/show.html.erb', type: :view do
  describe 'posts show page' do
    before(:each) do
      @user1 = User.create(name: 'Edward', photo: 'eddie.png', bio: 'Edwards Bio', posts_counter: 0,
                           email: 'oluyaratosin123@gmail.com', password: 'root19', confirmed_at: Time.now)

      @user2 = User.create(name: 'Erid', photo: 'erid.png', bio: 'Erids Bio', posts_counter: 0,
                           email: 'direakanbi@outlook.com', password: 'root20')

      visit root_path
      fill_in 'Email', with: 'oluyaratosin123@gmail.com'
      fill_in 'Password', with: 'root19'
      click_button 'Log in'

      @post1 = Post.create(title: 'Edward Post', text: 'This is Edwards Post', comments_counter: 0, likes_counter: 0,
                           user: @user1)
      @post2 = Post.create(title: 'Erid Post', text: 'This is Erids Post', comments_counter: 0, likes_counter: 0,
                           user: @user1)
      @post3 = Post.create(title: 'Sean Post', text: 'This is Seans Post', comments_counter: 0,
                           likes_counter: 0, user: @user1)

      @comment1 = Comment.create(text: 'Hey Edward', user: User.first, post: Post.first)
      @comment2 = Comment.create(text: 'How are you doing today?', user: User.first, post: Post.first)

      visit user_post_path(@user1, @post1)
    end

    it 'should display post title' do
      expect(page).to have_content('Edward Post')
    end

    it 'should display the post author' do
      expect(page).to have_content('Edward')
    end

    it 'should display the number of comments' do
      post = Post.first
      expect(page).to have_content(post.likes_counter)
    end

    it 'should display the post text' do
      expect(page).to have_content('This is Edwards Post')
    end

    it 'should display the author of each comment' do
      post = Post.first
      comment = post.comments.first
      expect(page).to have_content(comment.user.name)
    end

    it 'should display the comment of each commentor' do
      expect(page).to have_content('Hey Edward')
      expect(page).to have_content('How are you doing today?')
    end
  end
end
