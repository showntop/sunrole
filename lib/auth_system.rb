module AuthSystem

  def current_user

    @current_user ||= login_form_session
  end

  def signin_user(user)
    #puts "user::#{user.to_yaml}"
    return if user.blank?
    session[:current_user_id] = user.id
    puts "AuthSystem::signin_user#{session}"
    #cookies
    #request.env
  end

  def signout_user
    session[:current_user_id] = nil

    #cookies
    #request.env
  end

  def login_form_session
    puts "AuthSystem::login_form_session::#{session[:current_user_id]}"
    return nil if session[:current_user_id].blank?
    User.find(session[:current_user_id])
  end
end
