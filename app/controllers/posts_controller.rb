class PostsController < ApplicationController
  before_action :move_to_index, except: %i[index show search rank]
  before_action :set_post, only: %i[show edit update destroy]

  def index
    @posts = Post.includes(:user).order("created_at DESC").page(params[:page]).per(10)
  end

  def show
    @comment = Comment.new
    @comments = @post.comments.includes(:user)
    @comment_count = Comment.where(post_id: @post.id).count
    @like_count = Like.where(post_id: @post.id).count
  end

  def new
    @post = Post.new
    redirect_to posts_path if @post.save
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to posts_path, notice: "Success new post"
    else
      redirect_to new_post_path, alert: "Failed new post"
    end
  end

  def edit
    if @post.user == current_user
      render "edit"
    else
      redirect_to root_path, alert: 'Warning! Do not enter directly'
    end
  end

  def update
    if @post.update(post_params)
      redirect_to posts_path(@post.id), notice: "Success post update"
    else
      redirect_to edit_post_path, alert: "Failed update post"
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path, notice: "Success post delete"
  end

  def search
    @posts = Post.search(params[:keyword]).order("created_at DESC").page(params[:page]).per(10)
  end

  def rank
    @ranks = Post.find(Like.group(:post_id).order('count(post_id) desc').pluck(:post_id))
    @ranks = Kaminari.paginate_array(@ranks).page(params[:page]).per(10)
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
