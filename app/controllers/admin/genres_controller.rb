class Admin::GenresController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_genre, only: [:edit, :update]

  def index #admin_genres_path
    @new_genre = Genre.new
    @genres = Genre.page(params[:page]).per(10)
  end

  def create #admin_genres_path
    @new_genre = Genre.new(genre_params)
    if @new_genre.save
      flash[:success] = "新規保存しました。"
      redirect_to admin_genres_path
    else
      @genres = Genre.page(params[:page]).per(10)
      render 'index'
    end
  end

  def edit #edit_admin_genre_path
  end

  def update #admin_genre_path
    if @genre.update(genre_params)
      flash[:success] = "変更しました。"
      redirect_to admin_genres_path
    else
      redirect_to edit_admin_genre_path
    end
  end

  private

  def genre_params
    params.require(:genre).permit(:name)
  end

  def set_genre
    @genre = Genre.find(params[:id])
  end

end
