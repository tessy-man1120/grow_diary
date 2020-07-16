class PostsController < ApplicationController
  before_action :move_to_index, except: [:index, :show, :search, :rank]
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = Post.includes(:user).order("created_at DESC").page(params[:page]).per(10)
  end

  def new
    @post = Post.new
    if @post.save
      redirect_to posts_path
    end
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to posts_path, notice:"Success new post"
    else
      redirect_to new_post_path, alert:"Failed new post"
    end
  end

  def show
    @comment = Comment.new
    @comments = @post.comments.includes(:user)
    @comment_count = Comment.where(post_id: @post.id).count
    @like_count = Like.where(post_id: @post.id).count
  end

  def edit
  end

  def update
    @post.update(post_params)
    redirect_to posts_path(@post.id), notice: "Success post update"
  end

  def destroy
    @post.destroy
    redirect_to posts_path, alert: "Success post delete"
  end

  def search
    @posts = Post.search(params[:keyword]).order("created_at DESC").page(params[:page]).per(10)
    # respond_to do |format|
    #   format.html
    #   format.json
    # end
  end

  def rank
    @ranks = Post.find(Like.group(:post_id).order('count(post_id) desc').limit(10).pluck(:post_id))
  end

  private
  def post_params
    params.require(:post).permit(:title, :text, :image, tag_ids: []).merge(user_id: current_user.id)
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end

  def set_post
    @post = Post.find(params[:id])
  end

end
