class PostsController < ApplicationController
  before_filter :signed_in_user, only: [:create, :destroy, :edit]
  before_filter :correct_user, only: [:destroy, :edit]

  def create
    @post = current_user.posts.build(params[:post])
    if @post.save
      flash[:success] = "Post created!"
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    if admin_signed_in?
      @post = Post.find(params[:id])
      render :edit
    else
      flash[:error] = "Only the admin user can delete posts!"
      redirect_to root_path
    end
  end

  def update
    @post = Post.find(params[:id])


    if @post.update_attributes(params[:post])
      flash[:success] = "Post edited!"
      redirect_to root_path
    else
      render :edit
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
