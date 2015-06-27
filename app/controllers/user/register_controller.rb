class User::RegisterController < ApplicationController

  skip_before_filter :login_required

  def new

  end

  def create

  end
end
