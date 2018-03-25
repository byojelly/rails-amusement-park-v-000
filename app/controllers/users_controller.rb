class UsersController < ApplicationController
  before_action :set_user, only:[:show, :edit, :update, :destroy]


  def new
    #application controller callback
    #binding.pry
    @user = User.new
  end
  def create
    #binding.pry
    @user = User.new(user_params)
  # binding.pry
    if @user.save
      session[:user_id] = @user.id
  #session.inspect
      #redirect_to @user
      redirect_to user_path(@user), notice: "Welcome to the theme park!"
    else

      render :new
    end
  end
  def show
    @message = params[:message] if params[:message]
    @message ||=false  #set @message to false if it is nil, false, or undefined
  end
  def update
      if @user.update(user_params)
        redirect_to @user, notice: "User was successfully updated."
      else
        render :edit
      end
  end
  def edit
  end
  private
      # Use callbacks to share common setup or constraints between actions.
      #not needed because we already setup in application controller
  # =>  def set_user
  # =>      @user = User.find(params[:id])
  # =>  end
  ## Never trust parameters from the scary internet, only allow the white list through.
  #boom strong params
  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation, :height, :tickets, :nausea, :admin, :happiness)
  end
  def set_user
      @user = User.find_by(id: params[:id])
  end



end
