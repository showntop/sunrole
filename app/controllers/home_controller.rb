class HomeController < ApplicationController
  #skip_before_action :login_required
  omit_the_guard

  def index
    Archieve.all
    respond_to do |format|
      format.html #
      format.json { render json: {code: -1, message: '未登录'} }
    end
  end
end
