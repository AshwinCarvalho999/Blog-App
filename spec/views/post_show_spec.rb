require 'rails_helper'

RSpec.describe 'posts/show.html.erb', type: :view do
  describe 'a user show page' do
    before(:each) do
      @user = User.create(name: 'Motunrayo',
                          photo: 'https://picsum.photos/200',
                          bio: 'Abuja Real Lady',
                          posts_counter: 0)
      @first_post = Post.create(author_id: @user.id, title: 'Hello 1', text: 'This is my first post',
                                comments_counter: 0, likes_counter: 0)
      @last_post = Post.create(author_id: @user.id, title: 'Hello 4', text: 'This is my fourth post',
                               comments_counter: 0, likes_counter: 0)
      Comment.create(post_id: @last_post.id, author_id: @user.id, text: 'This is the 1st comment on the 4th post')
      Comment.create(post_id: @last_post.id, author_id: @user.id, text: 'This is the 2st comment on the 4th post')
      Comment.create(post_id: @last_post.id, author_id: @user.id, text: 'This is the 3st comment on the 4th post')
      visit user_posts_path(@user)
    end

    it 'shows user name' do
      expect(page).to have_content(@user.name)
    end

    it 'shows the user photo' do
      expect(page.body).to include('https://picsum.photos/200')
    end

    it 'shows number of comments a post has' do
      expect(page.body).to include('Comments: 3')
    end

    it 'shows number of likes a post has' do
      expect(page.body).to include('Likes: 0')
    end

    it 'shows the title of the post' do
      expect(page).to have_content(@last_post.title)
    end

    it 'shows part of a post body (This is my first post)' do
      expect(page).to have_content('This is my first post')
    end

    it 'shows the 1st comment on a post (This is the 1st comment on the 4th post)' do
      expect(page).to have_content('This is the 1st comment on the 4th post')
    end

    it 'Not to show the Pagination button' do
      expect(page.body).not_to include('Pagination')
    end

    it 'Redirect to post show page when a post is clicked' do
      click_link(@last_post.title)
      expect(current_path).to eq(user_post_path(@user, @last_post))
    end
  end
end
