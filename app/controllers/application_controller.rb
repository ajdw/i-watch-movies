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

  	# Custom helper method that finds the current user based off the key value of user_id fron the session
	def current_user
		# if is included to determine that there is a value passed to the session's user_id key value
		# using the instance variable @current_user
		@current_user ||= User.find(session[:user_id]) if session[:user_id]
	end

	# Declaring helper_method and passing in :current_user so it's accessible in all views
	helper_method :current_user

  def current_user?(user)
    current_user == @user
  end


  helper_method :current_user?

end



