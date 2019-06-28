class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception


private
  def require_signin
  	unless current_user
# url of the session stored in session key
      session[:intended_url] = request.url
  		redirect_to new_session_url, alert: "Please sign in first!"
  	end
  end

# Custom helper method that says current user based off the key value of user_id fro, the session
	def current_user
# If it is included to determine that there is a value passed to the session's user_id key value
# @current_user instance variable undefine? then assign its value using ||=
# At user find, by passing in the parameters, the current session and assigned :user_id
		@current_user ||= User.find(session[:user_id]) if session[:user_id]
	end

# Declaring helper_method and passing in :current_user so it's accessible in all views
	helper_method :current_user

  def current_user?(user)
    current_user == @user
  end


  helper_method :current_user?

  def require_admin
# Here we say, "Unless the current user is an admin... then we..."
    unless current_user.admin?
# "...redirect them to the root_url with an alert"
      redirect_to root_url, alert: "Unauthorized access!"
    end
  end


  def current_user_admin?
    current_user && current_user.admin?
  end

# Here we call on the helper_method in order to call current_user_admin? into the view
  helper_method :current_user_admin?

end



