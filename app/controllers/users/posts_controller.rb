class Users::PostsController < ApplicationController
	before_action :authenticate_user!

  def index
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

  def show
  	@post = Post.find(params[:id])
  	@posts = current_user.posts.all
  end

  def destroy
  	@post = Post.find(params[:id])
  	@post.destroy
  	redirect_to user_path(current_user)
  end


  private

  def post_params
  	params.require(:post).permit(:training_post, :post_image)
  end
end
