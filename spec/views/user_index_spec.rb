require 'rails_helper'

RSpec.describe 'User Index', type: :feature do
  before(:each) do
    @user1 = User.create(
      name: 'Promise',
      bio: 'Fullstack Developer',
      photo: 'http://promise.com',
      posts_counter: 4
    )

    @user2 = User.create(
      name: 'Omachi',
      bio: 'Ruby on Rails Developer',
      photo: 'http://omachi.com',
      posts_counter: 3
    )
  end

  describe 'users index page' do
    it 'shows the right username' do
      visit users_path
      expect(page).to have_content('Promise')
      expect(page).to have_content('Omachi')
      expect(page).to_not have_content('Luna')
    end

    it 'displays the users profile photo' do
      visit users_path
      expect(page).to have_css("img[src*='http://promise.com']")
      expect(page).to have_css("img[src*='http://omachi.com']")
    end

    it 'displays the exact Number of posts' do
      visit users_path
      expect(page).to have_content('Number of Posts: 4')
      expect(page).to have_content('Number of Posts: 3')
    end

    it 'displays the user_path when clicked' do
      visit users_path
      click_link 'Promise'
      expect(page).to have_current_path(user_path(@user1))
    end

    it 'renders the bio in show path' do
      visit users_path
      click_link 'Omachi'
      expect(page).to have_content('Ruby on Rails Developer')
    end
  end
end
