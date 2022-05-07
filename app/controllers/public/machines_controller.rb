class Public::MachinesController < ApplicationController

  def index #machines_path
    @machines = Machine.all
    @genres = Genre.all
  end

  def show #machine_path
    @machine = Machine.find(params[:id])
  end
end
