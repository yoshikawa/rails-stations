class Admin::ReservationsController < ApplicationController
  before_action :set_reservation, only: %i[new]
  before_action :find_reservation, only: %i[edit show update destroy]

  def index
    @reservations = Reservation.all
  end

  def new; end

  def create
    @sheet = params[:reservation][:sheet_id]
    @schedule = params[:reservation][:schedule_id]
    @name = params[:reservation][:name]
    @email = params[:reservation][:email]
    @date = params[:reservation][:date]
    @reservation = Reservation.new(reservation_params)
    if search(@date, @sheet, @schedule) &&
       !@sheet.nil? && !@schedule.nil? && !@name.nil? && !@date.nil? && !@email.nil?

      @reservation.save
      redirect_to admin_reservations_path, status: 302
    else
      flash[:danger] = '作成できませんでした'
      redirect_to new_admin_reservation_path(sheet_id: @sheet, schedule_id: @schedule, name: @name, email: @email, date: @date),
                  status: 400
    end
  end

  def show; end

  def edit; end

  def search(date, sheet, schedule)
    @reservations = Reservation.where(date: date, schedule_id: schedule, sheet: sheet)
    return true if @reservations.count == 0

    false
  end

  def update
    @sheet = params[:sheet_id]
    @schedule = params[:schedule_id]
    @name = params[:name]
    @email = params[:email]
    @date = params[:date]
    @reservation = Reservation.find(params[:id])
    if @reservation.update(reservation_params)
      redirect_to admin_reservations_path, status: 302
      nil
    else
      flash[:danger] = '作成できませんでした'
      redirect_to edit_admin_reservation_path(sheet_id: @sheet, schedule_id: @schedule, name: @name, email: @email, date: @date),
                  status: 400
    end
  end

  def destroy
    @reservation.destroy
    redirect_to admin_reservations_path
  end

  private

  def reservation_params
    params.require(:reservation).permit(:schedule_id, :sheet_id, :date, :name, :email)
  end

  def set_reservation
    @reservation = Reservation.new
  end

  def find_reservation
    @reservation = Reservation.find(params[:id])
  end
end
