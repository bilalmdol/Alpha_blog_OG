class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "Welcome to #{@user.username} the Alpha Blog!!"
      redirect_to articles_path
    else
      render "new"
    end
  end

  private

  def user_params
    params.require(:users).permit(:username, :email, :password)
  end
end
