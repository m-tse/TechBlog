require 'spec_helper'

describe "StaticPages" do
  describe "Home page" do
    it "Should have title Matt Tse's Blog" do
      visit 'root'
      page.should have_selector('title', :text => "Matt Tse's Blog")
    end
  end
end
