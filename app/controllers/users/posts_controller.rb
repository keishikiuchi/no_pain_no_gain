class Users::PostsController < ApplicationController
	before_action :authenticate_user!

  def index
    @posts = Post.all
    @bodies = Body.all

  end

  def new
  	@post = Post.new
  end

  def create
  	@post = Post.new(post_params)
    @post.user_id = current_user.id
	  if @post.save
	  	redirect_to user_path(current_user)
	  else
	  	render action: :new
	  end
  end


  def destroy
  	@post = Post.find(params[:id])
  	@post.destroy
  	redirect_to user_path(current_user)
  end


  private

  def post_params
  	params.require(:post).permit(:exercise, :firstset_weight, :firstset_rep, :secondset_weight, :secondset_rep, :thirdset_weight, :thirdset_rep, :fourthset_weight, :fourthset_rep, :fifthset_weight, :fifthset_rep, :body_parts)
  end

  def body_params
    params.require(:body).permit(:body_fat, :body_weight, :memo, :image)
  end

  def user_params
    params.require(:user).permit(:name, :profile, :profile_image)
  end

end
