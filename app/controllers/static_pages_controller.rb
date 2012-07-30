class StaticPagesController < ApplicationController
  def home

    @user = User.find_by_email("matt.s.tse@gmail.com")
    if(@user!=nil)
    @posts = @user.posts
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
