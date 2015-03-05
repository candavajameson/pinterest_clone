class PinsController < ApplicationController

	before_filter :authenticate_user!, only: [:new, :create, :edit, :update, :show]
	before_filter :set_pin, only: [:show, :edit, :update]


	def index
		@pins = Pin.page(params[:page]).per(10)
	end

	def new
		@pin = Pin.new
	end

	def create
		@pin = Pin.new pin_params
		@pin.user = current_user

		if @pin.save
			redirect_to pins_path, notice: 'succesfully created pin!'
		else
			render 'new'
		end
	end

	def edit
	end

	def update
		if @pin.update_attributes pin_params
			redirec_to pins_path, notice: 'succesfully updated pin!'
		else
			render 'edit'
		end
	end

	def show
		@pins = @pin.user.pins.where.not(id: params[:id])
	end

	private
	def pin_params
		params.require(:pin).permit(:title,
									:banner,
									:description)
	end

	def set_pin
		@pin = Pin.find(params[:id])
	end

end
