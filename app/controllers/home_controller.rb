class HomeController < ApplicationController
  layout "home_layout"

  def index
    @search = nil
    session[:search] = nil
  end
end
