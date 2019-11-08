class PostsController < ApplicationController
  before_action :set_post, only: [:show, :destroy]

  def index
    @posts = Post.order(created_at: :desc)
  end

  def show
    @post
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      redirect_to posts_path, notice: '投稿しました'
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
    @post.destroy
    redirect_to posts_path, notice: '削除しました'
  end

  private

  def post_params
    params.require(:post).permit(:image, :image_cache, :caption)
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
