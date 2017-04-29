class PlayersController < ApplicationController

  def new
    @player = Player.new
  end

  def create
    @team = Team.find(player_params[:team_id])
    @player = @team.players.create(player_params)
    redirect_to team_path(@team)
  end

  private
    def player_params
      params.require(:player).permit(:full_name, :position, :email, :address,
      :phone, :birth_date, :ocupation, :phote, :leg, :team_id)
    end
end
