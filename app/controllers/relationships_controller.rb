class RelationshipsController < ApplicationController
  def follow
    current_user.follow(params[:id])
    @user = User.find(params[:id])
    if @user.save
      redirect_to user_path(@user), notice: "Followed successfully"
    end
  end

  def unfollow
    current_user.unfollow(params[:id])
    @user = User.find(params[:id])
    redirect_to user_path(@user), notice: "Followed canceled"
  end
end
