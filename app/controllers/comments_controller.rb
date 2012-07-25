class CommentsController < ApplicationController
  before_filter :signed_in_user, only: [:create]
  def create
    @comment = current_user.comments.build(post_id: params[:comment][:post_id], 
content: params[:comment][:content])
 
 p params

    if @comment.save
      flash[:success] = "Left a comment!"
      redirect_to root_path
    else
      flash[:failure] = "nope didn't work"
      render 'comments/new'
    end
  end

  def new
    if signed_in?
      @postID=params[:id]
      @comment=current_user.comments.build(post_id:@postID)
    else
      flash[:error] = "Only signed in users can leave comments!"
      redirect_to root_path
    end
  end

end
