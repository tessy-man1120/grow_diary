class RelationshipsController < ApplicationController

  def follow
    current_user.follow(params[:id])
    @user = User.find(params[:id])
    redirect_to user_path(@user)
  end
  
  def unfollow
    current_user.unfollow(params[:id])
    @user = User.find(params[:id])
    redirect_to user_path(@user)
  end

end
