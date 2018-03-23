class SessionsController < ApplicationController

  def new
    #raise params.inspect
  end
  def create
    @user = User.find_by(name: params[:user][:name])
    return head(:forbidden) unless @user.authenticate(params[:user][:password])
    session[:user_id] = @user.id
    redirect_to user_show_path(@user)
  end
    #deleting the user session
  def destroy
      session.delete :name
      redirect_to '/'
  end

end
