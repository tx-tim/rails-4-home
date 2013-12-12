class UsersController < ApplicationController
  
  def new
  	@user = User.new
  end

  def show
  	# show action
  	@user = User.find(params[:id])
  end

  def create
  	@user = User.new(user_params)
  	if @user.save
      sign_in @user
  		flash[:success] = "Welcome - Successfully created a new user"
  		redirect_to @user
  	else
  		render 'new'
  	end
  end

  private
	  
	  def user_params
	  	params.require(:user).permit(:name, :email, :password, :password_confirmation)
	  end

end
