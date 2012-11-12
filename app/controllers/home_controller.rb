class HomeController < ApplicationController
  layout "home_layout"

  def index
    # we are clearing  the cookie session here which resets the saved
    # search parameters
    @search = Search.new
    session[:search] = nil
  end
end
