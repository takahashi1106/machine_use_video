class Admin::UsersController < ApplicationController
  before_action :authenticate_admin!
  before_action :admin_set_user, only: [:show, :edit, :update]

  def index #admin_users_path
    @users = User.page(params[:page]).per(10)
  end

  def show #admin_user_path
  end

  def edit #edit_admin_user_path
  end

  def update #admin_user_path
    if @user.update(user_params)
      flash[:success] = "会員情報を変更しました"
      redirect_to admin_users_path
    else
      render 'edit'
    end
  end

  private

  def admin_set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:last_name,:first_name,:email,:tel_number,:is_deleted)
  end

end