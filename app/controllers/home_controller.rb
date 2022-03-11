class HomeController < ApplicationController
  def index
  end

  def about
    @hello = "fancy"
  end
end
