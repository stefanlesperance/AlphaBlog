class SessionsController < ApplicationController

	def new
	end

	def create
		user = User.find_by(email: params[:session][:email].downcase)
		if user && user.authenticate(params[:session][:password])
			#This allows the session to carry around a bit of information about the user.
			#other information can also be stored about the user in the session, which is useful
			session[:user_id] = user.id 
			flash[:notice] = "Logged in successfully."
			redirect_to user
		else
			#Why flash.now? Because prior, we used flash paired with a redirect.
			#We must trigger flash.now, because we are not redirecting, but rendering.
			#A redirect triggers a full html cycle, which flash can persist through.
			#Render is not a new request to a new page, we are simply re-displaying the form.
			#So if we had employed flash normally, it would have just sat there, and only triggered AFTER a new request.
			flash.now[:alert] = "There was something wrong."
			render 'new'
		end
	end

	def destroy
		#All it takes
		session[:user_id] = nil
		flash[:notice] = "Logged out"
		redirect_to root_path
	end


end