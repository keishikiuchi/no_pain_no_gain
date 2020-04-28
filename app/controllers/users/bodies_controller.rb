class Users::BodiesController < ApplicationController
  before_action :authenticate_user!


  def show
    @user = User.find(params[:id])
    @body = Body.new
    @bodies = @user.bodies.all
    
  end

  def create
    @body = Body.new(body_params)
    @body.user_id = current_user.id
    if @body.save!
    redirect_to body_path(current_user)
    else
    	render action: :edit
    end
  end

  def edit
    @body = Body.find(params[:id])
  end

  def update
  	 @body = Body.find(params[:id])
    if @body.update(body_params)
    redirect_to users_bodies_new_path, :notice => 'You have updated user successfully.'
	end
  end

  def destroy
    @body = Body.find(params[:id])
    @body.destroy
    redirect_to users_bodies_new_path
  end


 private
  def body_params
    params.require(:body).permit(:body_fat, :body_weight, :memo, :image)
  end

  def user_params
    params.require(:user).permit(:name, :profile, :profile_image)
  end

end
