class ResumeController < ApplicationController
  def index
    if @selector == nil
      @selector = :education
    end
  end

  def education
    @selector = :education
    render :index
  end

  def work
    @selector = :work
    render :index
  end

  def projects
    @selector = :projects
    render :index
  end
end
