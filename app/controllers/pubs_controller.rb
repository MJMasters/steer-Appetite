class PubsController < ApplicationController
	
	def index
		if  pubs_near?
			flash.now[:success] = "Showing Pubs Near #{params[:search][:q]}"
			@pubs = Pub.near(params[:search][:q])

		elsif query?
			flash.now[:error] = "Oops, Sorry, something went wrong we did not find #{params[:search][:q]} please try again"
			@pubs = Pub.all
		
		else
			@pubs = Pub.all
		end
	end

	def new
		@pub = Pub.new
	end

	def create
		@pub = Pub.new(pub_params)
		
		if @pub.save
			redirect_to root_path
		else
			@pubs = Pub.all
		end
	end

private
		def pub_params
			params.require(:pub).permit(:name, :address, :latitude, :longitude, :rating)
		end

		def address_err?
		 	@pub.errors.full_messages == ["Latitude can't be Blank", "Longitude can be blank"]
		end
		
		def search?
			params[:search].present?
		end

		def query?
			if search?
			params[:search][:q].present?
			end
		end

		def pubs_near?
			if search? and query?
		 	Pub.near(params[:search][:q]).any?
		 	end
		end

end
