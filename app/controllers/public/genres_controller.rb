class Public::GenresController < ApplicationController
  
  def show #genre_path
    @genre = Genre.find(params[:id])
    @machines = Machine.where(genre_id: @genre.id)
  end
end
