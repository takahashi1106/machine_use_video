class Public::UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :like]
  before_action :authenticate_user!

  def show #user_path
  end

  def edit #edit_user_path
  end

  def update #user_path PATCH
    if @user == current_user
      @user.update(user_params)
      redirect_to user_path(@user.id)
    end
  end

  def like #like_user_path
    like = Favorite.where(user_id: @user.id).pluck(:machine_id)
    @likes = Machine.find(like)
  end


  private

  def user_params
    params.require(:user).permit(:last_name,:first_name,:email,:tel_number)
  end

  def set_user
    @user = User.find(params[:id])
  end

end
