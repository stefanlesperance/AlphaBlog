class ApplicationController < ActionController::Base
	#As with the principal of inheritance, all methods placed here are automatically accessible-
	#To all other classes that extend from it

	#current-user was utilized by views as well. Removing it from App Helpers deprives views of that.
	#the below method allows it to be accessed via application helper, which passes it onto the views.
	helper_method :current_user, :logged_in?

	def current_user
		#return the details of the user that has logged in
		#using session has, we have access to the user.id
		@current_user ||= User.find(session[:user_id])  if session[:user_id]
	end 

	def logged_in?
		## !! plus variable = turns it into a boolean
		!!current_user
	end

	def require_user
		#basically, if a user is not logged in, we display a message and redirect them
		if !logged_in?
			flash[:alert] = "You must be logged in to perform that action"
			redirect_to login_path
		end
	end

end
