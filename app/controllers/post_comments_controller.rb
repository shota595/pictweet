class PostCommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @post_comments = @post.post_comments.order(created_at: :desc).all
    @comment = current_user.post_comments.new(post_comment_params)
    @comment.post_id = @post.id
    @comment.save
    render 'post_comments/comment'
  end

  def destroy
    post = Post.find(params[:post_id])
    comment = post.post_comments.find_by(id:params[:id])
    comment.destroy
    redirect_to post_path(post.id)
  end

  private
  def post_comment_params
    params.require(:post_comment).permit(:user_id, :post_id, :comment)
  end
end
