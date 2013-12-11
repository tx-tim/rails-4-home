class SessionsController < ApplicationController
  def new
  end

  def create
  	user = User.find_by_email(params[:session][:email].downcase)
  	if user && user.authenticate(params[:session][:password])
  		# login the user and go to the profile page
  	else
  		#user has some errors
  		flash.now[:error] = "auth failed"
  		render "new"
  	end
  end

  def destroy
  end
end
