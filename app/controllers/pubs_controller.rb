class PubsController < ApplicationController
	
	def index
		@pubs = Pub.all
	end

	def new
		@pub = Pub.new
	end

	def create
		@pub = Pub.new(pub_params)
		if @pub.save
				flash[:success] = "Thanks for adding a new Pub"
				redirect_to pubs_path
			else
				flash[:error] = "Oops, Sorry, something went wrong please try again"
				render :new
			end
	end

private
	def pub_params
		params.require(:pub).permit(:name, :address, :latitude, :longitude, :rating)
	end
end
