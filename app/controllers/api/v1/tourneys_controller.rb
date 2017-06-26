module Api::V1
  class TourneysController < ApiController
    #before_action :authenticate

    def index
      @tourneys = Tourney.all
    end

    def create
      @tourney = @current_user.tourneys.build(tourney_params)
      #@tourney = User.last.teams.build(team_params)
      return if @tourney.save
      render json: {errors: @tourney.errors}, status: :unprocessable_entity
    end

    def show
      @tourney = Tourney.find(params[:id])
    end

    private

    def tourney_params
      params.require(:tourney).permit(:name, :description, :format, :location, :inscription_limit_date, :start_date, :end_date, :schedule, :prize, :price, :mail, :phone)
    end

  end

end
