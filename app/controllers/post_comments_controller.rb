class PostCommentsController < ApplicationController
  def index
    @comments = PostComment.all
  end

  def create
    @micropost = Micropost.find(params[:micropost_id])
    @comment = PostComment.new(comment_params)
    @comment.micropost = @micropost
    @comment.user = current_user
    if @comment.save
      flash[:success] = "Comment created!"
      redirect_to current_user
    else
      render 'shared/_comment_form'
    end
  end

  private

  def comment_params
    params.require(:post_comment).permit(:content, :user_id, :micropost_id)
  end
end
