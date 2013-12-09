class UsersController < ApplicationController
  def new
  	@user = User.new
  end

  def show
  	# show action
  	@user = User.find(params[:id])
  end
end
