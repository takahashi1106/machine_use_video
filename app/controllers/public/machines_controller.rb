class Public::MachinesController < ApplicationController
  before_action :authenticate_user!
  
  def index #machines_path
    @machines = Machine.all
    @genres = Genre.all
  end

  def show #machine_path
    @machine = Machine.find(params[:id])
    @machine_comment = MachineComment.new
  end
end
