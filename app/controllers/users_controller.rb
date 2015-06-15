class UsersController < ApplicationController



  def new
  @user = User.new
  end

  def create
    @user = User.new params.require(:user).permit(:username, :password, :password_confirmation)
  if @user.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @current_user = User.find(params[:id])
  end




end
