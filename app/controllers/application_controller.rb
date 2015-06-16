require 'auth_system'
#require 'guardian'

class ApplicationController < ActionController::Base
  protect_from_forgery

  include AuthSystem

  include Guardian::ControllerExtensions

  before_filter :login_required

  invoke_the_guard

  def login_required
    puts '-----------'
    puts current_user
    return if current_user || request.format.json?

    # save original URL in a cookie
    cookies[:destination_url] = request.original_url unless request.original_url =~ /uploads/

    redirect_to new_user_session_url

  end


end
