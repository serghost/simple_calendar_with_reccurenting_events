class HomeController < ApplicationController
  def index
    @events = Repeat.all
  end
end
