class MuseumsController < ApplicationController

	def index
		@museums = Museum.all # Get me all the museums!
	end
	
	def show
		@museum = Museum.find(params[:id]) # Get museum # whatever.
	end
	
	def new
		@museum = Museum.new
	end
	
	def create
		@museum = Museum.new(museum_params)
		if museum.save
			redirect_to museum_path(museum)
    	else
      		flash.now[:error] = @museum.errors.messages.first.join(" ")
      		render 'new'
    	end
	end
	
	private

  	def museum_params
    	params.require(:museum).permit(:name, :city)
  	end
  	
end
