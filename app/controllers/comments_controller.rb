class CommentsController < ApplicationController
  def create
    @comment = Comment.create(comment_params)
    respond_to do |format|
      format.html { redirect_to post_path(params[:post_id])  }
      format.json
    end
  end

  def destroy
    Comment.find_by(id: params[:id],post_id: params[:post_id]).destroy
    redirect_to post_path(params[:post_id]), notice: "Success comment delete"
  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, post_id: params[:post_id])
  end
end
