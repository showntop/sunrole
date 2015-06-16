module AuthSystem

  def current_user

    @current_user ||= login_form_session
  end

  def signin_user(user)
    return if user.nil?
    session[:current_user_id] = user.id

    #cookies
    #request.env
  end

  def signout_user
    session[:current_user_id] = nil

    #cookies
    #request.env
  end

  def login_form_session
    return nil if session[:current_user_id].blank?
    User.find(session[:current_user_id])
  end
end