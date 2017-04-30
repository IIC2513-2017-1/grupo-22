class PlayersController < ApplicationController
  before_action :set_team, only: [:new, :create]

  def new
    @player = @team.players.build
  end

  def create
    #@team = Team.find(params[:team_id])
    @player = @team.players.create(player_params)
    redirect_to team_path(@team)
  end

  private

    def set_team
      @team = Team.find(params[:team_id])
    end

    def player_params
      params.require(:player).permit(:full_name, :position, :email, :address,
      :phone, :birth_date, :ocupation, :phote, :leg)
    end
end
