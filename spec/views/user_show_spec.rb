require 'rails_helper'

RSpec.describe 'User Show', type: :feature do
  before(:each) do
    @user = User.create(
      name: 'Promise',
      bio: 'Fullstack Developer',
      photo: 'http://promise.com',
      posts_counter: 2
    )

    @post1 = Post.create(
      author: @user,
      title: 'First post',
      text: 'This is my first post',
      comments_counter: 1,
      likes_counter: 3
    )

    @post2 = Post.create(
      author: @user,
      title: 'Second post',
      text: 'This is my second post',
      comments_counter: 2,
      likes_counter: 2
    )
  end

  describe 'a user show page' do
    it 'displays the users profile photo' do
      visit user_path(@user)
      expect(page).to have_css("img[src*='http://promise.com']")
    end
  end

  it 'displays the user name' do
    visit user_path(@user)
    expect(page).to have_content('Promise')
  end

  it 'displays the user bio' do
    visit user_path(@user)
    expect(page).to have_content('Fullstack Developer')
  end

  it 'displays the right Number of posts' do
    visit user_path(@user)
    expect(page).to have_content('2')
  end

  it 'displays the first three posts of a user' do
    visit user_path(@user)
    expect(page).to have_content('First post')
    expect(page).to have_content('Second post')
  end

  it 'displays a button that helps view all of a users posts' do
    visit user_path(@user)
    expect(page).to have_content('see all posts')
  end

  it 'click to see all posts, it redirects to the users posts index page' do
    visit user_path(@user)
    click_link 'see all posts'
    expect(page).to have_current_path(user_posts_path(@user))
  end

  it 'click a users post, it redirects to the posts show page' do
    visit user_path(@user)
    click_link 'First post'
    expect(page).to have_current_path(user_post_path(@user, @post1))
  end

  it 'click a see all posts, it redirects me to the users posts index page' do
    visit user_path(@user)
    click_link 'see all posts'
    expect(page).to have_current_path(user_posts_path(@user))
  end
end
