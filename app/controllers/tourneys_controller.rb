require 'Wunderground'

class TourneysController < ApplicationController
  before_action :set_tourney, only: [:show, :edit, :update, :destroy]
  before_action :set_brackets, only: [:show]

  def create_email
     Email.create!(:account => email)
  end

  # GET /tourneys
  # GET /tourneys.json
  def index
    @tourneys = Tourney.all
  end

  # GET /tourneys/1
  # GET /tourneys/1.json
  def show
    @weather = Wunderground.get_weather(@tourney.city)
  end

  # GET /tourneys/new
  def new
    @tourney = Tourney.new
  end

  # GET /tourneys/1/edit
  def edit
    respond_to do |format|
      format.html {redirect_to @tourney  } 
      format.js
    end
  end

  # POST /tourneys
  # POST /tourneys.json
  def create
    user = User.find(current_user.id)
    @tourney = user.tourneys.create(tourney_params)

    respond_to do |format|
      if @tourney.save
        foro = Foro.create({:title => "Forum of " + @tourney.name, :description => "In this forum you can ask any doubt you have about the procedures, rules, etc. of the tourney. In adittion, all the news regardles the tourney will be posted here by "})
        @tourney.foro = foro
        format.html { redirect_to @tourney, notice: 'Tourney was successfully created.' }
        format.json { render :show, status: :created, location: @tourney }
        
      else
        format.html { render :new }
        format.json { render json: @tourney.errors, status: :unprocessable_entity }
        format.js 
      end
    end
  end

  # PATCH/PUT /tourneys/1
  # PATCH/PUT /tourneys/1.json
  def update
    respond_to do |format|
      if @result=@tourney.update(tourney_params)
        format.html { redirect_to @tourney, notice: 'Tourney was successfully updated.' }
        format.json { render :show, status: :ok, location: @tourney }
        format.js {flash.now[:notice]= "Tourney was successfully updated."}
      else
        format.html { render :edit }
        format.json { render json: @tourney.errors, status: :unprocessable_entity }
        format.js 
      end
    end
  end

  # DELETE /tourneys/1
  # DELETE /tourneys/1.json
  def destroy
    @tourney.destroy
    respond_to do |format|
      format.html { redirect_to tourneys_url, notice: 'Tourney was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tourney
      @tourney = Tourney.find(params[:id])
      @foro = @tourney.foro
    end

    def set_brackets
      if @tourney.format == 'Playoffs'
        brackets = Hash.new('no_match')
        @tourney.matches.each do |m|
          if m.bracket_code.present?
            brackets[m.bracket_code] = m
          end
        end
        @brackets = brackets
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tourney_params
      params.require(:tourney).permit(:name, :description, :format, :location, :inscription_limit_date, :start_date, :end_date, :schedule, :prize, :price, :mail, :phone, :city)
    end
end
