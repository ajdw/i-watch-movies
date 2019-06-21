class UsersController < ApplicationController
	def index
		@user = User.all
	end

	def show
		@user = User.find(params[:id])
	end

	def new
		@user = User.new
	end

	# Here we define a create action in our UsersController
	def create
	# We assign a variable (@user) equal to a new user instance and pass through the params our user_params
		@user = User.new(user_params)
	# if all the forms are validated then we save and redirect the user to their @user page with a notice
		if @user.save
			redirect_to @user, notice: "Thanks for signing up!"
		else
	# if the forms are not validated then we render a new user template
			render :new
		end
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		if @user.update(user_params)
			redirect_to @user, notice: "Account successfully updated!"
		else
			render :edit
		end
	end

	def destroy
		# We grab the user account and store it in a variable called @user
		@user = User.find(params[:id])
		# We use the built in Ruby method to point to that user account and destroy it!
		@user.destroy
		# We redirect to the root url with an alert that says "Account successfully deleted!"
		redirect_to root_url, alert: "Account successfully deleted!"
	end
		

private 
	def user_params
		params.require(:user).
			permit(:name, :email, :password, :password_confirmation)
	end
end
