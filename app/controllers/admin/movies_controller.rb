class Admin::MoviesController < ApplicationController
    def index
      @movies = Movie.all
    end

    def new
      @movie = Movie.new
    end
    
    def edit
      @movie = Movie.find(params[:id])
    end

    def create
      @movie = Movie.new(movie_params)
      if @movie.save
        flash[:success] = "登録完了"
        redirect_to("/admin/movies")
      else
        flash[:danger] = "登録失敗"
        render action: :new
      end
    end

    def update
      @movie = Movie.find(params[:id])
      if @movie.update(movie_params)
        flash[:success] = "更新完了"
        redirect_to("/admin/movies")
      else
        flash[:danger] = "更新失敗"
        render action: :new
      end
    end

    def destroy
      @movie = Movie.find(params[:id]);
      if @movie.destroy
        redirect_to("/admin/movies")
        flash[:success] = "削除完了"
      end
    end

    private
    def movie_params
      params.require(:movie).permit(:name, :year, :description, :image_url, :is_showing)
    end
end
