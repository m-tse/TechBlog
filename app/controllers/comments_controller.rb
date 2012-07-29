
class CommentsController < ApplicationController
  before_filter :signed_in_user, only: [:create]
  def create
    @comment = current_user.comments.build(params[:comment])

    if @comment.save
      flash[:success] = "Left a comment!"
      redirect_to root_path
    else
      flash[:failure] = "Error leaving comment, please try again."
      render 'comments/new'
    end
  end

  def new
    if signed_in?
      @post = Post.find_by_id(params[:id])
      @comment=current_user.comments.build(post_id:params[:id])
    else
      flash[:error] = "Only signed in users can leave comments!"
      redirect_to root_path
    end
  end

end

