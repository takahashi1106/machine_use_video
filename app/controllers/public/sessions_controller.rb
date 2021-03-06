# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
  before_action :reject_user, only: [:create]
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
  def after_sign_in_path_for(resource)
    machines_path
  end

  def after_sign_out_path_for(resource)
    about_path
  end

  def guest_sign_in
    user = User.guest
    sign_in user
    flash[:notice] =  'guestuserでログインしました。'
    redirect_to machines_path
  end

  protected
    # 退会しているかを判断するメソッド
  def reject_user
    # 入力されたemailからアカウントを1件取得
    @user = User.find_by(email: params[:user][:email])
    # 取得したアカウントのパスワードと入力されたパスワードが一致してるかを判別 #trueの場合
    if @user
      if @user.valid_password?(params[:user][:password]) && !@user.active_for_authentication?
        flash[:alert] = 'お客様は退会済みです。申し訳ございませんが、別のメールアドレスをお使いください。'
        redirect_to new_user_session_path
      end
    end
  end

end