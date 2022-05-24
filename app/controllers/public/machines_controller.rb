class Public::MachinesController < ApplicationController
  before_action :authenticate_user!
  #before_action :search

  def index #machines_path
    @machines = Machine.page(params[:page]).per(6)
    @genres = Genre.all
    # キーワード検索
    @search = Machine.ransack(params[:q])
    #distinct: trueは重複したデータを除外
    @machiness = @search.result(distinct: true).limit(5)
  end

  def show #machine_path
    @machine = Machine.find(params[:id])
    @machine_comment = MachineComment.new
  end

end
