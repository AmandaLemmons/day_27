class UsersController < ApplicationController


  def new
  @user = User.new
  end

  def create
    @user = User.new params.require(:user).permit(:username, :password, :password_confirmation)
    if @user.save
    session[:user_id] = @user.id
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    if @current_user.nil?
      redirect_to sign_in_path
    else
      @user = User.find(params[:id])
    end

  end


end
