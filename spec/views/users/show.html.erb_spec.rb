require 'rails_helper'

RSpec.describe 'users/show.html.erb', type: :feature do
  describe 'User' do
    before(:each) do
      @user1 = User.create! name: 'Edward', photo: 'icon.png', password: 'root21', email: 'shahiern@yahoo.com',
                            bio: 'test bio', confirmed_at: Time.now
      visit new_user_session_path
      fill_in 'Email', with: 'oluyaratosin123@gmail.com'
      fill_in 'Password', with: 'root21'
      click_button 'Log in'

      @post1 = @user1.posts.create!(title: 'test title 1', text: 'test text 1', comments_counter: 0, likes_counter: 0)
      @post2 = @user1.posts.create!(title: 'test title 2', text: 'test text 2', comments_counter: 0, likes_counter: 0)
      @post3 = @user1.posts.create!(title: 'test title 3', text: 'test text 3', comments_counter: 0, likes_counter: 0)
      click_on 'Edward'
    end

    it 'should show the username of the user' do
      expect(page).to have_content('Edward')
    end

    it 'should show the photo for ther user' do
      image = page.all('img')
      expect(image.size).to eql(1)
    end

    it 'should show number of posts for the user' do
      expect(page).to have_content('Number of posts: 3')
    end

    it 'should show the bio for the user' do
      expect(page).to have_content('test bio')
      visit user_session_path
    end

    it 'Should see the first 3 posts for the user.' do
      expect(page).to have_content 'test text 1'
      expect(page).to have_content 'test text 2'
      expect(page).to have_content 'test text 3'
    end

    it 'should see a button that lets me view all of a users posts' do
      expect(page).to have_content('See all post')
    end

    it 'When I click to see all posts, it redirects me to the user\'s post\'s show page.' do
      click_link 'test title 1'
      expect(page).to have_current_path user_post_path(@user1, @post1)
    end

    it 'When I click to see all posts, it redirects me to the users posts index page.' do
      click_link 'See all posts'
      expect(page).to have_current_path user_posts_path(@user1)
    end
  end
end
