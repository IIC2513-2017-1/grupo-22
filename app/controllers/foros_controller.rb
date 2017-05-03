class ForosController < ApplicationController

	before_action :set_foro, only: [:show, :edit, :update]


	def show

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
