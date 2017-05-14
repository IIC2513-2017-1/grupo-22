class MatchesController < ApplicationController
  before_action :set_tourney, only: [:new, :create, :destroy]
  before_action :set_match, only: [:show, :edit, :update, :destroy]

  def create
    @match = @tourney.matches.create(match_params)
    redirect_to tourney_path(@tourney)
  end

  def destroy
    @match.delete
    redirect_to tourney_path(@tourney), notice: "Partido borrado del torneo"
  end

  private
  def set_match
    @match = Match.find(params[:id])
  end

  def set_tourney
    @tourney = Tourney.find(params[:tourney_id])
  end

  def match_params
    params.require(:match).permit(:home_team_id, :away_team_id, :date)
  end
end
