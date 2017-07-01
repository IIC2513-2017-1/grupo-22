class SearchController < ApplicationController
  def index
    if params[:search]
      @teams = Team.search(params[:search]).order("name DESC")
      @tourneys = Tourney.search(params[:search]).order("name DESC")
    else
      @teams = Team.all.order("name_at DESC")
      @tourneys = Tourney.all.order("name_at DESC")
    end
  end
end
