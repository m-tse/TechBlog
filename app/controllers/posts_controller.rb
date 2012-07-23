class PostsController < ApplicationController
  before_filter :signed_in_user, only: [:create, :destroy]
  before_filter :correct_user, only: :destroy

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
    @post.destroy
    redirect_to root_path
  end

  private
  def correct_user
    @post = current_user.posts.find_by_id(params[:id])
    redirect_to root_path if @post.nil?
  end


end
