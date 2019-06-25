class SessionsController < ApplicationController
  def new
  end

  def create
    if user = User.authenticate(params[:email], params[:password])
      session[:user_id] = user.id
      flash[:notice] = "Welcome back, #{user.name}!"
      redirect_to user
    else
      flash.now[:alert] = "Invalid email/password combination!"
      render :new
    end
  end

  def destroy
  	# the session's key value of :user_id is set to nil, which means the session has no user logged in!
    session[:user_id] = nil
    # we redirect to the root url with a notice that pops up letting us know we've now signed out
    redirect_to root_url, notice: "You're now signed out!"
  end
end
