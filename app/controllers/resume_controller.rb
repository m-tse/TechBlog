class ResumeController < ApplicationController
  def index
    if @selector == nil
      render :education
    else
    render :workExperience
    end
  end
  def education
  end

  def workExperience
  end
end
