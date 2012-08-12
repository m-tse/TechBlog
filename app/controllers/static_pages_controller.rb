class StaticPagesController < ApplicationController
  def home

    @user = User.find_by_email("matt.s.tse@gmail.com")
    if(@user!=nil)
    @posts = @user.posts.paginate(page: params[:page], :per_page =>2)
    end
  end


  def contact
@contact_me = PageContent.find_by_name("contact_me")
  end

  def resume
    @resume_education = PageContent.find_by_name("resume_education")
    @resume_projects = PageContent.find_by_name("resume_projects")
    @resume_work_experience = PageContent.find_by_name("resume_work_experience")
  end


  def projects
    @projects = PageContent.find_by_name("projects")
  end

  def about
    @about_me = PageContent.find_by_name("about_me")
  end
end
