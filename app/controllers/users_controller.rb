class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
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
