class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = Post.order(created_at: :desc)
  end

  def show
    @post
  end

  def new
    if params[:back]
      @post = Post.new(post_params)
    else
      @post = Post.new
    end
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
    @post
  end

  def update
    if @post.update(post_params)
      redirect_to post_path(@post.id), notice: '更新しました'
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path, notice: '削除しました'
  end

  def confirm
    @post = Post.new(post_params)
    render :new if @post.invalid?
  end

  private

  def post_params
    params.require(:post).permit(:image, :image_cache, :caption)
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
