module SessionsHelper

  # Logs in given user
  def log_in(user)
    session[:user_id] = user.id
    # creates a temp cookie and with user.id and places on users browser, which will expire when the window is closed
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def logged_in?
    !current_user.nil?
  end
end
