class Admin::MachinesController < ApplicationController
  before_action :set_machine, only: [:show, :edit, :update]
  before_action :authenticate_admin!

  def new #new_admin_machine_path
    @new_machine = Machine.new
  end

  def create #admin_machines_path
    @new_machine = Machine.new(machine_params)
    if @new_machine.save
      flash[:success] = "新規保存しました。"
      redirect_to admin_machines_path
    else
      render 'new'
    end
  end

  def index #admin_machines_path
    @machines = Machine.all
  end

  def show #admin_machine_path
  end

  def edit #edit_admin_machine_path
  end

  def update #admin_machine_path
    if @machine.update(machine_params)
      flash[:success] = "変更しました。"
      redirect_to admin_machines_path
    else
      render 'edit'
    end
  end

  private

  def machine_params
    params.require(:machine).permit(:name,:explanation,:genre_id,:video)
  end

  def set_machine
    @machine = Machine.find(params[:id])
  end

end
