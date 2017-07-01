class PlayersController < ApplicationController
  before_action :set_team, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_player, only: [:edit, :update, :show, :destroy]

  def show
  end

  def index
    @players = Player.all
  end

  def edit
    respond_to do |format|
      format.html
      format.js
    end
  end

  def update

    respond_to do |format|
    if @result = @player.update(player_params)
      format.html {redirect_to team_player_path(@player.team, @player), notice: "Player updated"}
      format.js {flash.now[:notice] = "Player updated"}
    else
      format.html {render :edit , alert: "Problem updating player"}
      format.js
    end
    end
  end

  def new
    @player = @team.players.build
  end

  def create

    @player = @team.players.create(player_params)

    respond_to do |format|
      if @result = @player.save
        format.html {redirect_to team_path(@team), notice: "Player added to team"}
        format.js {flash.now[:notice] = "Player added to team"}
      else
        format.html {redirect_to team_path(@team), alert: "Could not create player"}
        format.js {flash.now[:alert] = "Could not create player"}
      end
    end
  end

  def destroy
    respond_to do |format|
      if @result = @player.destroy
        format.html {redirect_to team_path(@team), message: "Player deleted from team"}
        format.js {flash.now[:message] = "Player deleted from team"}
      else
        format.html {redirect_to team_path(@team), alert: "Could not delete player from team"}
        format.js {flash.now[:alert] = "Could not create player"}
      end
    end
  end

  private

    def set_team
      @team = Team.find(params[:team_id])
    end

    def set_player
      @player = Player.find(params[:id])
    end

    def player_params
      params.require(:player).permit(:full_name, :position, :email, :address,
      :phone, :birth_date, :ocupation, :photo, :leg)
    end
end
