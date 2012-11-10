class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :init_search

  def init_search
    @search ||= Search.new
  end
end
