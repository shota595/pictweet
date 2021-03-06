class FavoritesController < ApplicationController

  def create
    @post   = Post.find(params[:post_id])
    favorite = current_user.favorites.new(post_id: @post.id)
    favorite.save
    render 'favorite'
  end

  def destroy
    @post       = Post.find(params[:post_id])
    favorite = current_user.favorites.find_by(post_id: @post.id)
    favorite.destroy
    render 'favorite'
  end
end
