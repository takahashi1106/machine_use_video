class Public::MachineCommentsController < ApplicationController

  def create #machine_machine_comments_path
    machine = Machine.find(params[:machine_id])
    comment = MachineComment.new(machine_comment_params)
    comment.user_id = current_user.id
    comment.machine_id = machine.id
    comment.save
    redirect_to machine_path(machine.id)
  end

   private

  def machine_comment_params
    params.require(:machine_comment).permit(:comment)
  end

end
