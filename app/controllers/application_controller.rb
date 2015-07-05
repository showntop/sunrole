require 'auth_system'
require 'guardian'

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  include AuthSystem

  include Guardian::ControllerExtensions

  before_action :login_required

  invoke_the_guard

  def login_required
    return if current_user

    # save original URL in a cookie
    cookies[:destination_url] = request.original_url unless request.original_url =~ /uploads/

    respond_to do |format|
      format.html { redirect_to new_user_session_url }
      format.json { render json: {code: -1, message: '未登录'} }
    end

  end


end
