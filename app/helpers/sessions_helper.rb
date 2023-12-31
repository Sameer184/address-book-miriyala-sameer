module SessionsHelper
    # Log in the given user
    def log_in(user)
      session[:user_id] = user.id
    end
  
    # Log out the current user
    def log_out
      session.delete(:user_id)
    end
  
    # Returns the current logged-in user (if any)
    def current_user
      @current_user ||= User.find_by(id: session[:user_id])
    end
  
    # Check if a user is logged in
    def logged_in?
      !current_user.nil?
    end
  end
