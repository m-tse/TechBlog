class PageContentsController < ApplicationController
  before_filter :admin_user, only: [:edit, :update]


  def edit
    @page_contents = PageContent.find(params[:id])
    render :edit
  end

  def update
    @page_contents = PageContent.find(params[:id])

    if @page_contents.update_attributes(params[:page_content])
      p params

      flash[:success] = "Page edited!"
      redirect_to root_path
    else
      render :edit
    end
  end


  private
  def admin_user
    if !admin_signed_in?
      flash[:error] = "Only a signed in admin user can work with posts!"
      redirect_to root_path
    end
  end

end
