class UsersController < ApplicationController

  def show
    @post = Post.find_by(params[:id])
    @user = User.find(params[:id])
    @posts = @user.posts
  end

end
