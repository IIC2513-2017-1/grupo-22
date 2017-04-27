class TorneysController < ApplicationController
  before_action :set_torney, only: [:show, :edit, :update, :destroy]

  # GET /torneys
  # GET /torneys.json
  def index
    @torneys = Torney.all
  end

  # GET /torneys/1
  # GET /torneys/1.json
  def show
  end

  # GET /torneys/new
  def new
    @torney = Torney.new
  end

  # GET /torneys/1/edit
  def edit
  end

  # POST /torneys
  # POST /torneys.json
  def create
    @torney = Torney.new(torney_params)

    respond_to do |format|
      if @torney.save
        format.html { redirect_to @torney, notice: 'Torney was successfully created.' }
        format.json { render :show, status: :created, location: @torney }
      else
        format.html { render :new }
        format.json { render json: @torney.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /torneys/1
  # PATCH/PUT /torneys/1.json
  def update
    respond_to do |format|
      if @torney.update(torney_params)
        format.html { redirect_to @torney, notice: 'Torney was successfully updated.' }
        format.json { render :show, status: :ok, location: @torney }
      else
        format.html { render :edit }
        format.json { render json: @torney.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /torneys/1
  # DELETE /torneys/1.json
  def destroy
    @torney.destroy
    respond_to do |format|
      format.html { redirect_to torneys_url, notice: 'Torney was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_torney
      @torney = Torney.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def torney_params
      params.require(:torney).permit(:name, :description, :format, :location, :inscription_limit_date, :start_date, :end_date)
    end
end
