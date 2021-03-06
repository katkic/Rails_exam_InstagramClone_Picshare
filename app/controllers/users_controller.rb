class UsersController < ApplicationController
  skip_before_action :login_required, only: [:show, :new, :create]

  def index
    @users = User.order(created_at: :asc)
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to user_path(@user.id), notice: 'ユーザー情報を登録しました'
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(
      :email,
      :full_name,
      :user_name,
      :password,
      :password_confirmation
    )
  end
end
