class PlayersController < ApplicationController
  before_action :set_team, only: [:new, :create, :destroy]
  before_action :set_player, only: [:edit, :update, :show]

  def show
  end

  def edit
  end

  def update
    if @player.update(player_params)
      redirect_to team_player_path(@player.team, @player)
    else
      render 'edit'
    end
  end

  def new
    @player = @team.players.build
  end

  def create

    @player = @team.players.create(player_params)

    respond_to do |format|
      if @player.save
        format.html {redirect_to team_path(@team), notice: "Player added to team"}
      else
        format.html {redirect_to team_path(@team), alert: "Could not create player"}
        format.js {flash.now[:alert] = "Could not create player"}
      end
    end
  end

  def destroy
    @player = @team.players.find(params[:id])
    @player.destroy
    redirect_to team_path(@team)
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
      :phone, :birth_date, :ocupation, :phote, :leg)
    end
end
