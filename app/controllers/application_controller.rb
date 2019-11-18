class ApplicationController < ActionController::Base
  helper_method :current_user
  before_action :login_required

  def login_required
    redirect_to new_session_path, notice: 'ログインしてください' unless current_user
  end

  def logedin
    redirect_to posts_path if current_user
  end

  # 投稿確認画面で再読み込みした場合、新規投稿画面へリダイレクト
  def chack_id
    redirect_to new_post_path if params[:id] == 'confirm'
  end

  private

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end
end
