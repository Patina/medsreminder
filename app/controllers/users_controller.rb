class UsersController < ApplicationController
	before_action :set_user, only: [:edit, :update, :show, :destroy]
	before_action :authenticate_user!, only: [:profile]

  def profile
    @medicine = Medicine.new
    render :show
  end

	def index
		@users = User.all
	end
  
  def new
  	@user = User.new
  end
  
  	def create
    @user = User.new(user_params)
    if @user.save
    redirect_to @user, notice: "New user created." 
  else
    render :new
    end
  end

  def destroy
  end
end

private

def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :password, :telephone_number)
  end


