class Public::GenresController < ApplicationController
  
  def show #genre_path
    @genre = Genre.find(params[:id])
    @machine = Machine.find(params[:id])
  end
end
