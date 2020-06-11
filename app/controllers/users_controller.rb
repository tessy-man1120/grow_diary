class UsersController < ApplicationController
  
  def show
    @user = User.find(params[:id])
    @posts = @user.posts
  end

  def index
    @user = User.all
    # @user = User.find(params[:id])
  end

  def update
  end

end
