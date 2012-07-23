class StaticPagesController < ApplicationController
  def home

    @user = User.first
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
