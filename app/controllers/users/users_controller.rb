class Users::UsersController < ApplicationController
	before_action :authenticate_user!

  def new
  end

  def index
  end


  def show
  	 @user = current_user
  	 @posts = current_user.posts.all
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

  def post_params
  	params.require(:post).permit(:training_post, :post_image)
  end

  def user_params
  	params.require(:user).permit(:name, :profile, :profile_image)
  end
end
