class UsersController < ApplicationController

  def show
    @users = User.all
    @post = Post.find_by(params[:id])
    @user = User.find(params[:id])
    @posts = @user.posts.order("created_at DESC").page(params[:page]).per(10)
  end

end
