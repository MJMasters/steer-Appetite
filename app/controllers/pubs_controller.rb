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
			redirect _to root_path
		else
			flash[:error] = "Oops, Sorry, something went wrong we did not find that Pub please try again" if address_err?
			render :new
		end
	end

private
	def pub_params
		params.require(:pub).permit(:name, :address, :latitude, :longitude, :rating)
	end

	def address_err?
	 @pub.errors.full_messages == ["Latitude can't be Blank", "Longitude can be blank"]
	end
end
