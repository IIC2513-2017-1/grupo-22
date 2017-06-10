class MatchesController < ApplicationController
  before_action :set_match, only: [:show, :edit, :update, :destroy]
  before_action :set_tourney, only: [:new, :create, :destroy, :edit, :destroy]
  before_action :set_tourneys, only: [:index]

  def index
  end

  def create
    @match = @tourney.matches.create(match_params)

    respond_to do |format|
      if @result = @match.save
        format.html {redirect_to tourney_path(@tourney), notice: "Match was added"}
        format.js {flash.now[:notice] = "Match was added"}
      else
        format.html {redirect_to tourney_path(@tourney), alert: "Could not add match"}
        format.js {flash.now[:alert] = "Could not add match"}
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

    @tourney = @match.tourney

    if @tourney.format == "Playoffs"
      @brackets = @tourney.set_brackets
    end

    respond_to do |format|
      format.html {redirect_to tourney_path(@match.tourney), notice: "Match updated"}
      format.js {flash.now[:notice] ="Match updated"}
    end

  end

  def destroy
    respond_to do |format|
      if @result = !@match.played
        @match.delete

        if @tourney.format == "Playoffs"
          @brackets = @tourney.set_brackets
        end

        format.html {redirect_to tourney_path(@tourney), notice: "Match deleted from tourney"}
        format.js {flash.now[:notice] = "Match deleted from tourney"}
      else
        format.html {redirect_to tourney_path(@tourney), alert: "Could not delete match"}
        format.js {flash.now[:alert] = "Could not delete match"}
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
    @ranking = @match.tourney.participants
    @tourney = @match.tourney
    #@home_team = @ranking.find_by(team_id: @match.home_team.id)
    #@away_team = @ranking.find_by(team_id: @match.away_team.id)
    #@home_team.increment!(:matches_played)
    #@away_team.increment!(:matches_played)
    if @match.home_goals > @match.away_goals
      @match.update(winner: @match.home_team.name)
      #if @tourney.format == 'Torneo'
        #@home_team.increment!(:points, 3)
        #@home_team.increment!(:victories)
        #@away_team.increment!(:defeats)
      end
    elsif @match.home_goals < @match.away_goals
      @match.update(winner: @match.away_team.name)
      #if @tourney.format == 'Torneo'
        #@away_team.increment!(:points, 3)
        #@away_team.increment!(:victories)
        #@home_team.increment!(:defeats)
      end
    else
      if not @match.tourney.format == "Playoffs"
        @match.update(winner: "draw")
        #@home_team.increment!(:points)
        #@away_team.increment!(:points)
        #@away_team.increment!(:draws)


      end
    end
  end
end
