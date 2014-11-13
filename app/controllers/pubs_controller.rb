class PubsController < ApplicationController
	
	def new
		@pub = Pub.new
	end

	def create
		@pub = Pub.new(pub_params)
		if @pub.save
				flash[:success] = "Thanks for Adding a Pub"
				redirect_to pubs_path
			else
				flash[:error] = "Oops, sorry, something went wrong"
				render :new
			end
	end

	def index
		@pubs = Pub.all
	end

private
	def pub_params
		params.require(:pub).permit(:name, :address, :rating)
	end
end
