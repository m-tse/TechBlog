class CommentsController < ApplicationController
  before_filter :signed_in_user, only: [:create, :destroy]

  def create
    @comment = current_user.comments.build(params[:post])
    if @comment.save
      flash[:success] = "comment created!"
      redirect_to home_path
    end
  end

end
