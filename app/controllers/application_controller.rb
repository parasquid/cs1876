class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :init_search, :instantiate_controller_and_action_names

  def init_search
    @search = session[:search] || Search.new
  end

  def instantiate_controller_and_action_names
      @current_action = action_name
      @current_controller = controller_name
  end
end
