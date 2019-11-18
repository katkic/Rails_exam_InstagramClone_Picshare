class ApplicationController < ActionController::Base
  helper_method :current_user
  before_action :login_required

  def login_required
    redirect_to new_session_path, notice: 'ログインしてください' unless current_user
  end

  def logedin
    redirect_to posts_path if current_user
  end

  private

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end
end
