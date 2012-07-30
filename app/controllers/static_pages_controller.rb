class StaticPagesController < ApplicationController
  def home

    @user = User.find_by_email("matt.s.tse@gmail.com")
    if(@user!=nil)
    @posts = @user.posts.paginate(page: params[:page], :per_page =>2)
    end
  end


  def contact
  end

  def resume
  end


  def projects
  end

  def about
  end
end
