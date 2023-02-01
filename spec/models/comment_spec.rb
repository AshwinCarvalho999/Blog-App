require 'rails_helper'

RSpec.describe Comment, type: :model do
  before(:all) do
    @user = User.new(name: 'John', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Poland.')
    @post = Post.new(title: 'My first post', text: 'This is my first post.', author: @user, comments_counter: 4,
                     likes_counter: 6)
    @comment = Comment.new(author: @user, post: @post, text: 'Hey!, it is my first comment')
  end

  it 'is not valid without a text' do
    @comment.text = 'Hey!, it is my first comment'
    expect(@comment).to be_valid
  end

  it 'is only valid with a user' do
    @comment.author = @user
    expect(@comment).to be_valid
  end

  it 'is valid with a post' do
    @comment.post = @post
    expect(@comment).to be_valid
  end

  it 'should increment and update comment_counter by 1' do
    @post.increment!(:comments_counter)
    expect(@post.comments_counter).to eq(5)
  end
end
