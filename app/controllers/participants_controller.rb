class ParticipantsController < ApplicationController
  before_action :set_ids, only: [:create, :destroy]

  def create
    unless @tourney.teams.exists?(@team.id)
      @tourney.teams << @team
      #if @tourney.format == 'Torneo'
      #  @tourney.ranking.create_association(atributes = {team_id: @team.id, points: 0})
      #end
      redirect_to tourney_path(@tourney), notice: "Equipo agregado al torneo"
    else
      redirect_to tourney_path(@tourney), alert: "Equipo ya en el torneo"
    end
  end

  def destroy
    teams = get_teams_on_matches(@tourney)
    if teams.exclude?(@team)
      @tourney.teams.delete(@team)
      redirect_to tourney_path(@tourney), notice: "Equipo eliminado del torneo"
    else
      redirect_to tourney_path(@tourney), alert: "No puedes quitar un equipo que tiene un partido en el torneo"
    end
  end

  private

  def set_ids
    if params.has_key?(:team_id)
      @team = Team.find(params[:team_id])
    else
      @team = Team.find(params[:id])
    end
    @tourney = Tourney.find(params[:tourney_id])
  end

  def get_teams_on_matches(tourney)
    teams = []
    tourney.matches.each do |match|
      teams << match.away_team unless teams.include?(match.away_team)
      teams << match.home_team unless teams.include?(match.home_team)
    end
    return teams
  end

end
