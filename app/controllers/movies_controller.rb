class MoviesController < ApplicationController
	def index
		# 検索機能		
		@rgp = params[:is_showing]
		@keyp = params[:keyword]
		
		#入力値がなければ全て表示(初期表示含む)
		if @rgp == "" && @keyp == ""
			@movies = Movie.all
		end

		# @rangeは全てか上映中か上映予定か絞ったMovie配列
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

	def show
		@movie = Movie.find(params[:id])
		@schedules = @movie.schedules.all

		#日付プルダウンの表示
		today = Date.today
		@week = [today, today + 1, today + 2, today + 3, today + 4, today + 5, today + 6]

		#schedule_idプルダウンの配列
		@schedule_ids = []
		@schedules.each do |sc|
			@schedule_ids.push(sc.id)
		end
	end

	def reservation
		@sheets = Sheet.all
		schedule_id = params[:schedule_id]
		date = params[:date]
		movie_id = params[:movie_id]

		# 予約ずみのシート配列。同じ日付、同じschedule_idのレコードのうち、scheet_idのみを抽出した配列
		@dup = Reservation.where(schedule_id: schedule_id, date: date).pluck(:sheet_id)
		
		if schedule_id.blank? || date.blank?
			# redirect_to controller: :movies, action: :reservation, id: movie_id, schedule_id: schedule_id
			redirect_to controller: :movies, action: :show, movie_id: movie_id, status: 302
		end
	end
end