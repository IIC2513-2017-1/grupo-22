class ForosController < ApplicationController

	before_action :set_foro, only: [:show, :edit, :update]

	def index
    	@foros = Foro.all
  	end

	def show

	end

	def new
	end

	def create
		@foro.save
	end

	def edit
	end

	def update
	end

	private

    def set_foro
      @foro = Foro.find(params[:id])
    end
end
