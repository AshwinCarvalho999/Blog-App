require 'rails_helper'

RSpec.describe User, type: :model do
  before(:all) do
    @user = User.new(name: 'John', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Poland.',
                     posts_counter: 0)
  end

  context 'User implementation testing' do
    it 'User name should be present' do
      expect(@user.name).to eq('John')
    end

    it 'Recent post method should return zero' do
      expect(@user.three_most_recent_post.length).to be 0
    end

    it 'Post counter should be an interger' do
      expect(@user.posts_counter).to be_a_kind_of(Numeric)
    end
  end
end
