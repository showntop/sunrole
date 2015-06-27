class HomeController < ApplicationController


  def index
    Archieve.all
  end
end
