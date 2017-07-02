class ParticipantsController < ApplicationController
  before_action :set_ids, only: [:create, :destroy]

  def create
      respond_to do |format|
        if !(@team == nil)
          @result = @tourney.teams.exists?(@team.id)
          if !@result
            @tourney.teams << @team
            format.html {redirect_to tourney_path(@tourney), notice: "#{@team.name} added to Tourney"}
            format.js {flash.now[:notice]= "#{@team.name} added to Tourney"}
          else
            format.html {redirect_to tourney_path(@tourney), alert: "Team already on Tourney"}
            format.js {flash.now[:alert] = "#{@team.name} already on Tourney"}
          end
        else
          format.html {redirect_to tourney_path(@tourney), message: "Select a team"}
          format.js {flash.now[:message] = "Select a team"}
        end

      end
  end

  def destroy
    teams = get_teams_on_matches(@tourney)
    respond_to do |format|
      if @result = teams.exclude?(@team)
        @tourney.teams.delete(@team)
        format.html {redirect_to tourney_path(@tourney), message: "#{@team.name} deleted from Tourney"}
        format.js {flash.now[:message] = "#{@team.name} deleted from Tourney"}
      else
        format.html {redirect_to tourney_path(@tourney), alert: "Can not delete #{@team.name} from tourney"}
        format.js {flash.now[:alert] = "Can not delete #{@team.name} from tourney"}
      end
    end
  end

  private

  def set_ids

    @tourney = Tourney.find(params[:tourney_id])

    if params.has_key?(:team_id) and !(params[:team_id] == '') or params.has_key?(:id) and !(params[:id] == '')
      if params.has_key?(:team_id)
        @team = Team.find(params[:team_id])
      else
        @team = Team.find(params[:id])
      end
    else
      @team = nil
    end    
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
