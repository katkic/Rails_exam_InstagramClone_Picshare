class PostsController < ApplicationController
  before_action :set_post, only: [:edit, :update, :destroy]

  def index
    @posts = Post.order(created_at: :desc)
  end

  def show
    @favorite = current_user.favorites.find_by(post_id: params[:id])
    @post = Post.find(params[:id])
  end

  def new
    if params[:back]
      @post = Post.new(post_params)
    else
      @post = Post.new
    end
  end

  def create
    @post = current_user.posts.build(post_params)

    if @post.save
      PostMailer.post_mail(@post).deliver
      redirect_to posts_path, notice: '投稿しました'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to post_path(@post.id), notice: '投稿を更新しました'
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path, notice: '投稿を削除しました'
  end

  def confirm
    @post = current_user.posts.build(post_params)
    render :new if @post.invalid?
  end

  private

  def post_params
    params.require(:post).permit(:image, :image_cache, :caption)
  end

  def set_post
    @post = current_user.posts.find(params[:id])
  end
end
