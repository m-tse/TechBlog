class PostsController < ApplicationController
  before_filter :signed_in_user, only: [:create, :destroy]

  def create
    @post = current_user.posts.build(params[:post])
    if @post.save
      flash[:success] = "Post created!"
      redirect_to root_path
    else
      render 'posts/new'
    end
  end

  def new
    if admin_signed_in?
      @post = current_user.posts.build
    else
      flash[:error] = "Only the admin user can create new posts!"
      redirect_to root_path
    end
  end

  def destroy
  end
end
