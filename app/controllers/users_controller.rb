class UsersController < ApplicationController
  def show
    @user   = User.find(params[:id])
    @posts  = @user.posts.order(created_at: :desc).all
    @follow = Relationship.new
  end

  def edit
    @user = User.find(params[:id])
    if current_user.id != @user.id
      redirect_to user_path(@user.id)
    end
  end

  def update
    user = User.find(params[:id])
    if user.update(user_params)
      redirect_to user_path(user.id)
    else
      render :edit
    end
  end

  def followers
    @user = User.find(params[:id])
  end

  def followings
    @user = User.find(params[:id])
  end

  private
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end
end
