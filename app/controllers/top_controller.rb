class TopController < ApplicationController
  skip_before_action :login_required
  before_action :logedin

  def index
  end
end
