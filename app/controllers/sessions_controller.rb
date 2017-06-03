class SessionsController < ApplicationController

	 def new
	 end

	 def create
	     user = User.find_by(username: params[:session][:username])
	     if user&.authenticate(params[:session][:password])
	     	session[:user_id] = user.id
	    	redirect_to :back, notice: 'Login successful.'
	     else
	     	redirect_to(:back, alert: 'Wrong email or password.')
	     end
  	 end

	 def destroy
	    reset_session
	    redirect_to :back, notice: 'Logout successful.'
	 end
end