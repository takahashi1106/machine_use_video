class Public::UsersController < ApplicationController

  def show #user_path
    @user = User.find(params[:id])
  end

  def edit #edit_user_path
    @user = User.find(params[:id])
  end

  def update #user_path PATCH
    @user = User.find(params[:id])
    if @user == current_user
      @user.update(user_params)
      redirect_to user_path(@user.id)
    end
  end


  private

  def user_params
    params.require(:user).permit(:last_name,:first_name,:email,:tel_number)
  end

end
