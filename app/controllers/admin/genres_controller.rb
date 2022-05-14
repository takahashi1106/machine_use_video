class Admin::GenresController < ApplicationController
  before_action :set_genre, only: [:edit, :update]
  before_action :authenticate_admin!

  def index #admin_genres_path
    @new_genre = Genre.new
    @genres = Genre.all
  end

  def create #admin_genres_path
    @new_genre = Genre.new(genre_params)
    if @new_genre.save
      flash[:success] = "新規保存しました。"
      redirect_to admin_genres_path
    else
      @genres = Genre.all
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
      render 'edit'
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
