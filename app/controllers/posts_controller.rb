class PostsController < ApplicationController
  def index
    @posts     = Post.page(params[:page]).reverse_order.order(created_at: :desc).all
    # @user    = User.find(params[:id])
    # user       = User.find(params[:id])

    @user = current_user
    @favorite = Favorite.new
  end

  def show
    @posts     = Post.all
    @post = Post.find(params[:id])
    @post_comments = @post.post_comments.order(created_at: :desc).all
    @post_comment = PostComment.new
  end

  def new
    @post = Post.new
  end

  def create
    @post              = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
       redirect_to posts_path
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end


  def post_params
    params.require(:post).permit(:user, :body, :post_image)
  end
end
