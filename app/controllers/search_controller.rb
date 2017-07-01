class SearchController < ApplicationController
  def index
    if params[:search]
      @teams = Team.search(params[:search]).order("name DESC")
      @tourneys = Tourney.search(params[:search]).order("name DESC")
      @players = Player.search(params[:search]).order("full_name DESC")
    else
      @teams = Team.all.order("name DESC")
      @tourneys = Tourney.all.order("name DESC")
      @players = Player.all.order("full_name DESC")
    end
  end
end
