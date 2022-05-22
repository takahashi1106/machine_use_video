class Public::MachineCommentsController < ApplicationController

  def create #machine_machine_comments_path
    machine = Machine.find(params[:machine_id])
    comment = MachineComment.new(machine_comment_params)
    comment.user_id = current_user.id #|| current_user.admin?
    comment.machine_id = machine.id
    if comment.save
      redirect_to machine_path(params[:machine_id])
    else @error_comment = comment
      @machine = Machine.find(params[:machine_id])
      @machine_comment = MachineComment.new
      render 'public/machines/show'
    end
  end

  def destroy #machine_machine_comment_path
    comment = MachineComment.find(params[:id])
    if user_signed_in?
      comment.destroy
      redirect_to machine_path(params[:machine_id])
    elsif admin_signed_in?
      comment.destroy
      flash[:alert] = "削除しました。"
      redirect_to admin_machine_path(params[:machine_id])
    end
  end

  private

  def machine_comment_params
    params.require(:machine_comment).permit(:comment)
  end

end
