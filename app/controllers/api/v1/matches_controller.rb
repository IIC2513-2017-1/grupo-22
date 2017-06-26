module Api::V1
  class MatchesController < ApiController
    before_action :authenticate

    def index
      @matches = Match.all
    end
  end

end
