class ApplicationController < ActionController::Base

	add_flash_types :message

	protect_from_forgery with: :exception

	helper_method :current_user

	protected

	def current_user
		return @current_user if defined?(@current_user)
		@current_user = session.key?(:user_id) && User.find(session[:user_id])
	end

end
