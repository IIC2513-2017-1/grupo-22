class MatchesController < ApplicationController
  before_action :set_tourney, only: [:new, :create, :destroy]
  before_action :set_match, only: [:show, :edit, :update, :destroy]

  private
  def set_match
    @match = Match.find(params[:id])
  end

  def set_tourney
    @tourney = Tourney.find(params[:tourney_id])
  end
end
