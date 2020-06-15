class UsersController < ApplicationController

  def index
    # user = User.find_by(id: params[:id])
    # @nickname = user.nickname
    # @posts = user.posts
    @nickname = current_user.nickname
    @posts = current_user.posts
  end

  def show
    @user = User.find(params[:id])
    # user = User.find(params[:id])
    # @nickname = user.nickname
    # @posts = user.posts
  end



end
