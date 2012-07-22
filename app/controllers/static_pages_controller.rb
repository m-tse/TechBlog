class StaticPagesController < ApplicationController
  def home

    @user = User.find_by_email("matt.s.tse@gmail.com")
    @posts = @user.posts
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
