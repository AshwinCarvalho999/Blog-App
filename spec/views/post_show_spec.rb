require 'rails_helper'

RSpec.describe 'Post Show', type: :feature do
  before(:each) do
    @user1 = User.create(
      name: 'Victor',
      bio: 'Fullstack Developer',
      photo: 'http://victor.com',
      posts_counter: 2
    )

    @post1 = Post.create(
      author: @user1,
      title: 'First post',
      text: 'This is my first post',
      comments_counter: 0,
      likes_counter: 0
    )

    @post2 = Post.create(
      author: @user1,
      title: 'Second post',
      text: 'This is my second post',
      comments_counter: 0,
      likes_counter: 0
    )

    Comment.create(post: @post1, author: @user1, text: 'Hi everytone, nice to meet you!')
    Comment.create(post: @post1, author: @user1, text: 'Hello loves, welcome!!')
    Comment.create(post: @post2, author: @user1, text: 'How are you?, been a while')

    Like.create(post: @post1, author: @user1)
    Like.create(post: @post2, author: @user1)
  end

  describe 'A specific post with title, comments and counter' do
    it 'displays the post title' do
      visit user_post_path(@user1, @post1)
      expect(page).to have_content('First post')
    end

    it 'displays the user who wrote the post' do
      visit user_post_path(@user1, @post1)
      expect(page).to have_content('Victor')
    end

    it 'displays total comments of a post' do
      visit user_post_path(@user1, @post1)
      expect(page).to have_content('2')
    end

    it 'displays total likes of a post' do
      visit user_post_path(@user1, @post2)
      expect(page).to have_content('1')
    end

    it 'shows other parts of the post body' do
      visit user_post_path(@user1, @post1)
      expect(page).to have_content('This is my first post')
    end

    it 'shows username and comment of each commentor' do
      visit user_post_path(@user1, @post1)
      expect(page).to have_content('Victor: Hi everytone, nice to meet you!')
      expect(page).to have_content('Victor: Hello loves, welcome!!')
    end
  end
end
