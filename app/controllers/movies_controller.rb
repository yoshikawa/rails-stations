class MoviesController < ApplicationController
	def index		
		@rgp = params[:is_showing]
		@keyp = params[:keyword]

		if @rgp == "" && @keyp == ""
			@movies = Movie.all
		end

		if @rgp == "1"
			@range = Movie.where(is_showing: true)
		elsif @rgp == "0"
			@range = Movie.where(is_showing: false)
		else
			@range = Movie.all
		end

		if (@keyp == "")
			@movies = @range
		else
			@movies = @range.where( "name LIKE ? OR description LIKE ? ", "%#{@keyp}%", "%#{@keyp}%")
		end
	end
end
