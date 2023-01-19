require 'rails_helper'

RSpec.describe Post, type: :model do
  before(:all) do
    @user = User.new(name: 'John', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Poland.')
    @post = Post.new(title: 'My first post', text: 'This is my first post.', author: @user, comments_counter: 4,
                     likes_counter: 6)
  end

  context 'Test implementation to post model' do
    it 'Check the lenghth of post title to be less than 250' do
      expect(@post.title).to(satisfy { |x| x.length <= 250 })
    end

    it 'most recent post length should returns zero' do
      expect(@post.five_recent_comments.length).to be 0
    end

    it 'likes count validation should return true' do
      expect(@post.likes_counter).to(satisfy { |n| n >= 0 })
    end
  end
end
