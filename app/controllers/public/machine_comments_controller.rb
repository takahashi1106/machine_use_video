class Public::MachineCommentsController < ApplicationController
  before_action :authenticate_user!

  def create #machine_machine_comments_path
    @machine = Machine.find(params[:machine_id])
    @comment = MachineComment.new(machine_comment_params)
    @comment.user_id = current_user.id
    @comment.machine_id = @machine.id
    unless  @comment.save
      #redirect_to machine_path(params[:machine_id]) 非同期通信
      render 'error'
    end
  end

  def destroy #machine_machine_comment_path
    @machine = Machine.find(params[:machine_id])
    @comment = MachineComment.find(params[:id])
    @comment.destroy
      #redirect_to machine_path(params[:machine_id]) 非同期通信

    #elsif admin_signed_in? 管理者で不要
      #comment.destroy
      #flash[:alert] = "削除しました。"
      #redirect_to admin_machine_path(params[:machine_id])
  end

  private

  def machine_comment_params
    params.require(:machine_comment).permit(:comment)
  end

end
