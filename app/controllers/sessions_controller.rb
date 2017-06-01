class SessionsController < ApplicationController
  def new
  end

  def create
    if user = login(params[:email],params[:password])
      flash[:notic] = "登录成功"
      redirect_to root_path
    else
      flash[:notic] = "邮箱或密码错误"
      redirect_to new_session_path
    end
  end
end
