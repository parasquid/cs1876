class HomeController < ApplicationController
  layout "home_layout"

  def index
    @search = Search.new
    session[:search] = nil
  end
end
