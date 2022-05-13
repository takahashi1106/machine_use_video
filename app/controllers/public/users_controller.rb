class Public::UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:show, :edit, :update, :like,:withdraw]

  def show #user_path
  end

  def edit #edit_user_path
  end

  def update #user_path PATCH
    if @user == current_user
      @user.update(user_params)
      redirect_to user_path(current_user)
      flash[:success] = "会員情報を更新しました。"
    else
      render 'edit'
    end
  end

  def like #like_user_path
    like = Favorite.where(user_id: @user.id).pluck(:machine_id)
    @likes = Machine.find(like)
  end

  def unsubscribe #unsubscribe_user_path
  end

  def withdraw #withdraw_user_path
    #is_deletedカラムにフラグを立てる(defaultはfalse)
    @user.update(is_deleted: true)
    #ログアウトさせる
    reset_session
    flash[:notice] = "ありがとうございました。またのご利用を心よりお待ちしております。"
    redirect_to root_path
  end


  private

  def user_params
    params.require(:user).permit(:last_name,:first_name,:email,:tel_number)
  end

  def set_user
    @user = current_user
  end

end
