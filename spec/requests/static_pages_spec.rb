require 'spec_helper'

describe "StaticPages" do

  let(:base_title) { "Matthew Tse's Blog"}
  describe "Home page" do
    let(:user) { FactoryGirl.create(:user)}
    before { @post = user.posts.build(content: "Lorem ipsum", title: "lorem ipsum?")}

    it "should have home title" do
      visit 'root'
      page.should have_selector('title', :text => "#{base_title} | Home")
    end
  end

  describe "Resume Page" do
    it "should have Education title" do
      visit resume_path
      page.should have_selector('title', :text => "#{base_title} | Education")
    end
  end

  describe "Projects Page" do
    it "should have projects title" do
      visit projects_path
      page.should have_selector('title', :text => "#{base_title} | Projects")
    end
  end

  describe "About Me Page" do
    it "should have about me title" do
      visit about_path
      page.should have_selector('title', :text => "#{base_title} | About Me")
    end
  end

  describe "Contact Me Page" do
    it "should have contactme title" do
      visit contact_path
      page.should have_selector('title', :text => "#{base_title} | Contact Me")
    end
  end
end
