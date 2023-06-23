class Admin::SchedulesController < ApplicationController
  def index
    @movies = Movie.joins(:schedules).select("movies.name", "movies.id").group("movies.id")
  end

  def new
    @schedule = Schedule.new()
  end

  def create
    @schedule = Schedule.create(schedule_params)
    if @schedule.save
      flash[:success] = "登録完了"
      redirect_to("/admin/schedules")
    else
      flash[:danger] = "登録失敗"
      render action: :new
    end
  end

  def edit
    @schedule = Schedule.find(params[:id])
  end

  def update
    @schedule = Schedule.find(params[:id])
    if @schedule.update(schedule_params)
      flash[:success] = "更新完了"
      redirect_to("/admin/schedules")
    else
      flash[:danger] = "更新失敗"
      render action: :new, status: 400
    end
  end

  def destroy
    @schedule = Schedule.find(params[:id]);
    if @schedule.destroy
      redirect_to("/admin/schedules")
      flash[:success] = "削除完了"
    end
  end

  private
  def schedule_params
    params.require(:schedule).permit(:start_time, :end_time, :movie_id)
  end
end