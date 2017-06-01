class UsersController < ApplicationController
  # 注册页面
  def new
    @user = User.new
  end
  # 注册提交页面
  def create
    @user = User.new(params.require(:user).permit(:email,:password,:password_confirmation))
    if @user.save
      flash[:notice] = "注册成功"
      redirect_to root_path
    else
      render action: :new
    end
  end
end
