class UsersController < ApplicationController

  def show
    @post = Post.find_by(params[:id])
    @user = User.find(params[:id])
    @posts = @user.posts.order("created_at DESC").page(params[:page]).per(5)
    @user_count = Relationship.where(follow_id: @user.id).count
  end


end
