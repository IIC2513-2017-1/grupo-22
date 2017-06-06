class MatchesController < ApplicationController
  before_action :set_tourney, only: [:new, :create, :destroy, :edit]
  before_action :set_match, only: [:show, :edit, :update, :destroy]
  before_action :set_tourneys, only: [:index]

  def index
  end

  def create
    @match = @tourney.matches.create(match_params)

    respond_to do |format|
      if @result = @match.save
        format.html {redirect_to tourney_path(@tourney), notice: "Partido agregado al torneo"}
        format.js {flash.now[:notice] = "Partido agregado al torneo"}
      else
        format.html {redirect_to tourney_path(@tourney), alert: "No se puede realizar ese partido"}
        format.js {flash.now[:alert] = "No se puede realizar ese partido"}
      end
    end
  end

  def edit
    respond_to do |format|
      format.html {redirect_to edit_tourney_match_path(@tourney, @match)  } 
      format.js
    end
    
  end

  def update
    @match.update(match_params)
    if @match.played
      set_winner()
    else
      @match.update(winner: nil, home_goals:0, away_goals:0)
    end
    redirect_to tourney_path(@match.tourney), notice: "¡Updated result!"
  end

  def destroy
    respond_to do |format|
      if @result = !@match.played 
        @match.delete
        format.html {redirect_to tourney_path(@tourney), notice: "Partido eliminado del torneo"}
        format.js {flash.now[:notice] = "¡Partido eliminado del torneo!"}
      else
        format.html {redirect_to tourney_path(@tourney), alert: "No puedes eliminar el partido"}
        format.js {flash.now[:alert] = "No puedes eliminar el partido"}
      end
    end

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
    params.require(:match).permit(:home_team_id, :away_team_id, :date, :played,:home_goals, :away_goals, :winner, :bracket_code)
  end

  def set_winner
    #@ranking = @match.tourney.ranking
    if @match.home_goals > @match.away_goals
      @match.update(winner: @match.home_team.name)
      #@ranking.find(@match.home_team) += 3
    elsif @match.home_goals < @match.away_goals
      @match.update(winner: @match.away_team.name)
      #@ranking.find(@match.away_team) += 3
    else
      if not @match.tourney.format == "Playoffs"
        @match.update(winner: "draw")
      end
    end  
  end
end
