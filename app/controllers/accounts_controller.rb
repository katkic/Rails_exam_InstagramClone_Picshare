class AccountsController < ApplicationController
  before_action :set_user, only: %i[show edit update destroy]

  def show
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to account_path, notice: 'プロフィールを更新しました'
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    redirect_to root_path, notice: 'アカウントを削除しました'
  end

  private

  def user_params
    params.require(:user).permit(
      :email,
      :full_name,
      :user_name,
      :password,
      :password_confirmation,
      :image
    )
  end

  def set_user
    @user = current_user
  end
end
