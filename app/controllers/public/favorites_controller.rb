class Public::FavoritesController < ApplicationController

  def create #machine_favorites_path
    machine = Machine.find(params[:machine_id])
    favorite = current_user.favorites.new(machine_id: machine.id)
    favorite.save
    redirect_back(fallback_location: root_path)
  end

  def destroy #machine_favorites_path
    machine = Machine.find(params[:machine_id])
    favorite = current_user.favorites.find_by(machine_id: machine.id)
    favorite.destroy
    redirect_back(fallback_location: root_path)
  end
  
  def like
  end
  
end
