class Admin::MachinesController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_machine, only: [:show, :edit, :update]

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
    @machines = Machine.page(params[:page]).per(10)
  end

  def show #admin_machine_path
    @machine_comment = MachineComment.new
  end

  def edit #edit_admin_machine_path
  end

  def update #admin_machine_path
    if @machine.update(machine_params)
      flash[:success] = "変更しました。"
      redirect_to admin_machines_path
    else
      redirect_to edit_admin_machine_path
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
