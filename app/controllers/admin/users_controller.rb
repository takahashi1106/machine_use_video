class Admin::UsersController < ApplicationController
  before_action :authenticate_admin!
  
  def index #admin_users_path
    @users = User.all
  end

#退会機能を付けるのであれば以下のアクションを追加

  #def show #admin_user_path
    #@user = User.find(params[:id])
  #end
  
  #def edit #edit_admin_user_path
    #@user = User.find(params[:id])
  #end

end
