class SessionsController < ApplicationController

  def new
    #raise params.inspect
    @user = User.new
    @users = User.all
  end
  def create
    @user = User.find_by(name: params[:user][:name])
    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to user_path(@user), notice: "Welcome back to the theme park!"
    else
        redirect_to signin_path
    end

  end
    #deleting the user session
  def destroy
      session.delete :name
      redirect_to '/'
  end


end
