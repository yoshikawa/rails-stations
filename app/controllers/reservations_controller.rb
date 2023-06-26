class ReservationsController < ApplicationController
  def new
    @reservation = Reservation.new
    @movie = Movie.find_by(id: params[:movie_id])
    @schedule = Schedule.find_by(id: params[:schedule_id])
    @date = params[:date]
    @sheet_id = params[:sheet_id]

    if @date.nil? || @sheet_id.nil?
      render status: 400
    elsif @date && @sheet_id
      render status: 200
    end
  end

  def create
    @reservation = Reservation.new(reservation_params)

    # パラメータ
    schedule_id = reservation_params[:schedule_id]
    movie_id = Schedule.find(schedule_id).movie_id
    sheet_id = reservation_params[:sheet_id]
    date = reservation_params[:date]

    # 同じ日付で同じ映画、同じ席が取られていないか確認
    dup = Reservation.where(schedule_id: schedule_id, sheet_id: sheet_id)
    if dup.blank?
      if @reservation.save
        flash[:success] = '予約が完了しました'
        redirect_to controller: :movies, action: :show, id: movie_id
      else
        flash[:alert] = '登録失敗'
        redirect_to controller: :reservations, action: :new, schedule_id: schedule_id, movie_id: movie_id,
                    sheet_id: sheet_id, date: date
      end
    else
      flash[:alert] = 'その座席はすでに予約済みです'
      redirect_to controller: :movies, action: :reservation, id: movie_id, schedule_id: schedule_id, date: date
    end
  end

  def reservation_params
    params.require(:reservation).permit(:schedule_id, :sheet_id, :date, :name, :email)
  end
end
