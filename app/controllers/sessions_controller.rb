class SessionsController < ApplicationController

	 def new
	 end

	 def create
	    user = User.find_by(username: params[:session][:username])

	    respond_to do |format|
	     if user&.authenticate(params[:session][:password])
	     	session[:user_id] = user.id
	     	format.html {redirect_to :back, notice: 'Login successful.'}
	     else
	     	format.js {flash.now[:alert] = 'Wrong email or password.'}
	     end
  	 end
  	end
	 def destroy
	    reset_session
	    redirect_to :back, notice: 'Logout successful.'
	 end
end