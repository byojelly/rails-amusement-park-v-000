class UsersController < ApplicationController

  def new
    #application controller already defines the current user with the before_action
  end
  def create
    #binding.pry
    @user = User.new(user_params)
    #binding.pry
    if @user.save
      session[:user_id] = @user.id
      #redirect_to @user
      redirect_to user_path(@user)
    else
      #redirect_to root_path
      redirect_to new_user_path
    end

  end


  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end
   


end
