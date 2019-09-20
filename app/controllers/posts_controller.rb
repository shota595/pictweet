class PostsController < ApplicationController
  def index
    @posts = Post.all
    @user = User.find(params[:post.user_id])
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    post = Post.new(post_params)
    @post.save(post_params)
    redirect_to
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
