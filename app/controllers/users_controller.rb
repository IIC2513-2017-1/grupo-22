class UsersController < ApplicationController
  include Secured

  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :logged_in?, only: %i[edit update destroy]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
    respond_to do |format|
      format.html {redirect_to @user  } 
      format.js
    end
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @result = @user.save
        UserMailer.welcome_email(@user).deliver_later
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
        format.js { flash.now[:notice] = 'User created. Check your email.' }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
        format.js { flash.now[:notice] = 'Could not create user' }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    if user_params[:password].blank?
      user_params.delete :password
      user_params.delete :password_confirmation
    end

    respond_to do |format|
      if @result = @user.update_attributes(user_params)
        format.html { redirect_to @user, notice: 'Image was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
        format.js {flash.now[:notice]= "User was successfully updated."}
      else
        format.html { redirect_to @user, alert: 'An error ocurred.' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
        format.js
      end
    end


  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:full_name, :email, :username, :password,
      :password_confirmation, :avatar)
    end
end
