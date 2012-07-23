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
    @resumeSelector = :projects
  end

  def resumeSelect(resumeSelector)
    @resumeSelector=resumeSelector
  end

  def projects
  end

  def about
  end
end
