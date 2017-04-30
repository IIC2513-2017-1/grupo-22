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
    #@team = Team.find(params[:team_id])
    @player = @team.players.create(player_params)
    redirect_to team_path(@team)
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
