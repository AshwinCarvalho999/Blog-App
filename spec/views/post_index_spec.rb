require 'rails_helper'

RSpec.describe 'posts/show.html.erb', type: :view do
  before(:each) do
    @user = User.create(name: 'Davon',
                        photo: 'https://picsum.photos/200',
                        bio: 'Nigerian Chemist',
                        posts_counter: 0)
    @any_post = Post.create(author_id: @user.id, title: 'Hello', text: 'This is any post', comments_counter: 0,
                            likes_counter: 0)
    Comment.create(post: @any_post, author_id: @user.id, text: 'This is the 1st comment on the 4th post')
    Comment.create(post: @any_post, author_id: @user.id, text: 'This is the 2nd comment on the 4th post')
    Comment.create(post: @any_post, author_id: @user.id, text: 'This is the 3rd comment on the 4th post')
    visit user_posts_path(@user, @any_post)
  end

  it 'I can see who wrote the post' do
    expect(page).to have_content(@user.name)
  end

  it 'shows number of comments a post has' do
    expect(page.body).to include('Comments: 3')
  end

  it 'shows number of likes a post has' do
    expect(page.body).to include('Likes: 0')
  end

  it 'shows the title of the post' do
    expect(page).to have_content(@any_post.title)
  end

  it 'shows part of a post body (This is any post)' do
    expect(page).to have_content('This is any post')
  end

  it 'shows the user name of a comment' do
    expect(page).to have_content('Davon')
  end

  it 'shows the comment a user left' do
    expect(page).to have_content('This is the 2nd comment on the 4th post')
  end
end
