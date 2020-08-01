class TagsController < ApplicationController
  def index
    @tags = Tag.all
  end

  def show
    @tag = Tag.find(params[:id])
    @post = @tag.posts.order("created_at DESC").page(params[:page]).per(10)
  end
end
