class UserSessionsController < ApplicationController
  skip_before_action :require_login, except: :destroy

  def new
    @user = User.new
  end

  def create
    if @user = login(params[:email], params[:password])
      #TODO トップページへリダイレクト
      redirect_back_or_to root_path, notice: 'ログインに成功しました'
    else
      flash.now[:alert] = 'ログインに失敗しました'
      render action: 'new'
    end
  end

  def destroy
    logout
    #TODO トップページへリダイレクト
    redirect_to :sign_in, notice: 'ログアウトしました。'
  end
end
