module Api::V1
  class UsersController < ApiController
    #before_action :authenticate

    def show
      @user = User.find(params[:id])
    end
  end
end
