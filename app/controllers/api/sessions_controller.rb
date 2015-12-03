class Api::SessionsController < ApplicationController

  skip_before_action :login_required

  omit_the_guard

  def create
    login_name = params[:login] || ''
    password = params[:password] || ''

    if u = User.find_by_login_or_email(login_name)
      render json: {code: -1, message: I18n.t("login.incorrect_username_email_or_password")} and return unless u.password_right? password
      signin_user u
      
      render json: {code: 1, message: 'success', data: UserSerializer.new(u, root: false) }
    else
      render json: {code: -1, message: I18n.t("login.incorrect_username_email_or_password")}
    end
  end

  def destroy
    reset_session
    signout_user
  end

end
