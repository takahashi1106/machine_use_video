class Public::MachinesController < ApplicationController
  before_action :authenticate_user!
  #before_action :search

  def index #machines_path
    @machines = Machine.all
    @genres = Genre.all
    # キーワード検索
    @search = Machine.ransack(params[:q])
    #distinct: trueは重複したデータを除外
    @machiness = @search.result(distinct: true)
    # タグ検索
    #@tag_search = Machine.tagged_with(params[:search])
  end

  def show #machine_path
    @machine = Machine.find(params[:id])
    @machine_comment = MachineComment.new
  end

  #def search #search_machines_path
    # タグ検索
    #@tag_search = Machine.tagged_with(params[:search])
  #end

end
