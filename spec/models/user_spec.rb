require 'rails_helper'

RSpec.describe User, type: :model do
  before(:all) do
    @user = User.new(name: 'Promise', photo: 'https://unsplash.com/photos/M_-5YgbSdV3o',
                     bio: 'I am a frontend developer', posts_counter: 0)
  end
  context 'validation tests' do
    it 'name should have attributes and not blank' do
      expect(@user.name).to eq('Promise')
    end

    it 'returns photo if valid' do
      @user.photo = 'https://unsplash.com/photos/M_-5YgbSdV3o'
      expect(@user).to be_valid
    end

    it 'is valid with a bio' do
      @user.bio = 'I am a frontend developer'
      expect(@user).to be_valid
    end

    it 'post_counter should must be an integer' do
      @user.posts_counter = 1
      expect(@user).to be_valid
    end

    it 'is not valid if post counter is a string or nil' do
      @user.posts_counter = 'four'
      @user.posts_counter = nil
      expect(@user).to_not be_valid
    end

    it 'Recent post method should return zero' do
      expect(@user.three_most_recent_post.length).to be 0
    end
  end
end
