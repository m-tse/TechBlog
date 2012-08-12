class PostsController < ApplicationController

  before_filter :admin_user, only: [:create, :edit, :update, :new, :destroy]


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
    @post = Post.find(params[:id])
    render :edit
  end

  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(params[:post])
      p params
      flash[:success] = "Post edited!"
      redirect_to root_path
    else
      render :edit
    end
  end

  def new
    @post = current_user.posts.build
  end

  def destroy
    @post=current_user.posts.find_by_id(params[:id])
    @post.destroy
    redirect_to root_path
  end

  private
  def admin_user
    if !admin_signed_in?
      flash[:error] = "Only a signed in admin user can work with posts!"
      redirect_to root_path
    end
  end

end
