module ApplicationHelper
	# Custom helper method that finds the current user based off the key value of user_id fron the session
	def current_user
		# if is included to determine that there is a value passed to the session's user_id key value
		# using the instance variable @current_user
		@current_user ||= User.find(session[:user_id]) if session[:user_id]
	end
end
