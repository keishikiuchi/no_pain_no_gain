class Users::UsersController < ApplicationController
	before_action :authenticate_user!


  def show
  	 @user = User.find(params[:id])
     @posts = @user.posts.all
     @meetings = Meeting.all
     @users = User.all

  end

  def edit
  	 @user = User.find(params[:id])
  end

  def update
  	@user = User.find(params[:id])
  	if @user.update(user_params)
  	redirect_to user_path(current_user)
    end
  end

  private

  def user_params
  	params.require(:user).permit(:name, :profile, :profile_image)
  end

end
