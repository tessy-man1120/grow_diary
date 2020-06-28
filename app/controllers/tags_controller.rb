class TagsController < ApplicationController

  def index
    @tags = Tag.all
  end

  def show
    @tag = Tag.find_by(id: params[:id])
    @posts = Post.order("created_at DESC").page(params[:page]).per(10)
  end

end

