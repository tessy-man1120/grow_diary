class UsersController < ApplicationController

  def index
    @nickname = current_user.nickname
    @posts = current_user.posts.order("created_at DESC").page(params[:page]).per(10)
    
  end

  def show
    @post = Post.find_by(params[:id])
    @user = User.find(params[:id])
    # @user = User.find(params[:id])
  end

end
