class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @posts = @user.posts
  end

  def index
    @user = User.all
    # @user = User.find(params[:id])
  end

  # def create
  #   @new_image = User.new(user_params)
  #   if @new_image.save
  #     redirect_to users_url
  #   else
  #     render action: :index
  #   end
  # end

  def update
  end

end
