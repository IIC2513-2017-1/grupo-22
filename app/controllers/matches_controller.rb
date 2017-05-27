class MatchesController < ApplicationController
  before_action :set_tourney, only: [:new, :create, :destroy]
  before_action :set_match, only: [:show, :edit, :update, :destroy]
  before_action :set_tourneys, only: [:index]

  def index
  end

  def create
    @match = @tourney.matches.create(match_params)
    if @match.save
      redirect_to tourney_path(@tourney), notice: "¡Partido agregado al torneo!"
    else
      redirect_to tourney_path(@tourney), alert: "No se puede realizar ese partido"
    end
  end

  def edit
  end

  def update
    @match.update(match_params)
    if @match.played
      set_winner()
    end
    redirect_to tourney_path(@match.tourney), notice: "¡Updated result!"
  end

  def destroy
    @match.delete
    redirect_to tourney_path(@tourney), notice: "Partido eliminado del torneo"
  end

  private
  def set_match
    @match = Match.find(params[:id])
  end

  def set_tourney
    @tourney = Tourney.find(params[:tourney_id])
  end

  def set_tourneys
    @tourneys = Tourney.all
  end

  def match_params
    params.require(:match).permit(:home_team_id, :away_team_id, :date, :played,:home_goals, :away_goals, :winner)
  end

  def set_winner
    if @match.home_goals > @match.away_goals
      @match.update(winner: @match.home_team.name)
    elsif @match.home_goals < @match.away_goals
      @match.update(winner: @match.away_team.name)
    else
      @match.update(winner: "draw")
    end
  end
end
