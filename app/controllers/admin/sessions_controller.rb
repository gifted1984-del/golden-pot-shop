class Admin::SessionsController < ApplicationController
  def new
    redirect_to admin_dashboard_path if session[:admin_authenticated] == true
  end

  def create
    if admin_credentials_valid?(params[:username], params[:password])
      return_to = session[:admin_return_to]
      reset_session
      session[:admin_authenticated] = true
      redirect_to return_to.presence || admin_dashboard_path, notice: "管理者としてログインしました。"
    else
      flash.now[:alert] = "ユーザー名またはパスワードが正しくありません。"
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    reset_session
    redirect_to admin_login_path, notice: "ログアウトしました。"
  end
end
