class UsersController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]

  include Banken

  def new
    @user = User.new
    authorize! @user
  end

  def create
    @user = User.new(user_params)
    authorize! @user
    if @user.save
      #TODO: redirect先を変更
      redirect_to :sign_up, notice: 'Userは正常に作成されました'
    else
      render :new
    end
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation, :role, :superior_id)
    end
end
