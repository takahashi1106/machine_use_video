class Public::GenresController < ApplicationController
  before_action :authenticate_user!
  
  def show #genre_path
    @genre = Genre.find(params[:id])
    @machines = Machine.where(genre_id: @genre.id)
  end
end
