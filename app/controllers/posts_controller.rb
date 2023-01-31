class PostsController < ApplicationController
  def index
    @posts = @user.posts.includes(:comments)
  end

  def show
    @post = Post.includes(:comments, :likes).find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      flash[:success] = 'Your Post has benn created successfully'
      redirect_to user_post_path(current_user, @post)
    else
      flash.now[:error] = 'Error message: Post was not created !'
      render :new
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
