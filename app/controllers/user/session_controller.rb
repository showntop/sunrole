class User::SessionController < ApplicationController

  skip_before_filter :login_required
  omit_the_guard

  def new
    respond_to do |format|
      format.html 
    end
  end

  def create
    login_name = params[:login] || ''
    password = params[:password] || ''

    if u = User.find_by_login_or_email(login_name)
      render json: {error: I18n.t("login.incorrect_username_email_or_password")} and return unless u.password_right? password
      signin_user u
      respond_to do |format|
        format.json { render json: {content: 'success'} }
        format.html { redirect_to '/'}
      end
    else
      render json: {error: I18n.t("login.incorrect_username_email_or_password")}
    end
  end

  def destroy
    reset_session
    signout_user
  end
end
