class UsersController < ApplicationController

  def index
    @user = User.all
    # @user = User.find(params[:id])
    # @posts = @user.nickname
  end

  def show
    @user = User.find(params[:id])
  end



end
