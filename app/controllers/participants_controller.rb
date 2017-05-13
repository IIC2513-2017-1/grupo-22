class ParticipantsController < ApplicationController
  before_action :set_ids, only: [:create, :destroy]

  def create
    unless @tourney.teams.exists?(@team.id)
      @tourney.teams << @team
      redirect_to tourney_path(@tourney), notice: "Equipo agregado al torneo"
    else
      redirect_to tourney_path(@tourney), alert: "Equipo ya en el torneo"
    end
  end

  def destroy
    @tourney.teams.delete(@team)
    redirect_to tourney_path(@tourney), notice: "Equipo eliminado del torneo"
  end

  private

  def set_ids
    @team = Team.find(params[:team_id])
    @tourney = Tourney.find(params[:tourney_id])
  end

end
