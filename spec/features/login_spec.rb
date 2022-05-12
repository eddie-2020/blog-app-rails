require 'rails_helper'
RSpec.feature 'Logins', type: :feature do
  background { visit new_user_session_path }

  scenario 'should display email, password form fields and log in button' do
    expect(page).to have_field('user[email]')
    expect(page).to have_field('user[password]')
    expect(page).to have_button('Log in')
  end

  context 'Sign in' do
    scenario 'should try to sign in with blank fields' do
      click_button 'Log in'
      expect(page).to have_content 'Invalid Email or Password.'
    end

    scenario 'should try to sign with an incorrect data' do
      within 'form' do
        fill_in 'Email',	with: 'oluyaratosin123@gmail.com'
        fill_in 'Password',	with: 'root17'
      end

      click_button 'Log in'
      expect(page).to have_content 'Invalid Email or Password.'
    end

    scenario 'Sign with correct data' do
      @user = User.create(name: 'Edward', email: 'oluyaratosin123@gmail.com', password: 'root18')
      within 'form' do
        fill_in 'Email',	with: 'oluyaratosin123@gmail.com'
        fill_in 'Password',	with: 'root19'
      end
      click_button 'Log in'
      expect(page).to have_current_path(user_session_path)
    end
  end
end
