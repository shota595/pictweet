class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @posts = Post.find(params[:user.post.id])
  end
end
