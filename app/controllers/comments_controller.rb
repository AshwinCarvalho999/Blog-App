class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(params.require(:comment).permit(:text))
    @comment.user_id = current_user.id

    respond_to do |format|
      format.html do
        if @comment.save
          redirect_to user_post_path(current_user, @post), notice: 'Comment created successfully!'
        else
          # error message
          flash.now[:error] = 'Error: Post could not be created'
          # render new
          render :new, locals: { comment: }
        end
      end
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id])
    @comment.destroy
    respond_to do |format|
      format.html do
        flash[:success] = 'Comment deleted successfully'
        redirect_to user_post_path(current_user.id, @post.id)
      end
    end
  end
end
