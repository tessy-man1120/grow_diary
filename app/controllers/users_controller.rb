class UsersController < ApplicationController
  def show
    @post = Post.find_by(params[:id])
    @user = User.find(params[:id])
    @posts = @user.posts.order("created_at DESC")
    @likes = Like.where(user_id: @user.id).order("created_at DESC")
  end
end
