module SessionsHelper
# in ROR helper modules are chunks of reusable code - to be utilized by its corresponding controller. we can also expose this module to application_controller.rb to give our other controllers access to these methods as well

  # Logs in given user
  def log_in(user)
    session[:user_id] = user.id
    # creates a temp cookie and with user.id and places on users browser, which will expire when the window is closed
  end

  # redirects to forwarding_url (if it exists) or to default
  def redirect_back_or(default)
    redirect_to(session[:forwarding_url] || default)
    session.delete(:forwarding_url)
  end

  # stores the uRL trying to be accessed
  def store_location
    session[:forwarding_url] = request.original_url if request.get?
  end

  def current_user
    if (user_id = session[:user_id])
      @current_user ||= User.find_by(id: user_id)
    elsif (user_id = cookies.signed[:user_id])
      user = User.find_by(id: user_id)
      if user && user.authenticated?(cookies[:remember_token])
        log_in user
        @current_user = user
      end
    end
  end

  def current_user?(user)
    user == current_user
  end

  def logged_in?
    !current_user.nil?
  end

  def log_out
    forget(current_user)
    session.delete(:user_id)
    @current_user = nil
  end

  def forget(user)
    user.forget
    # clear remember_digest column
    cookies.delete(:user_id)
    cookies.delete(:remember_token)
  end

  def remember(user)
    user.remember
    cookies.permanent.signed[:user_id] = user.id
    # signed hashes our user_id before storing in cookie
    cookies.permanent[:remember_token] = user.remember_token
  end

end
