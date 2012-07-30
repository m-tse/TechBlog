require 'spec_helper'
require 'pp'

describe "Post pages" do

  subject { page }
  let(:admin_error) {"Only a signed in admin user can work with posts!"}

 


  describe "admin user should be able to put up a post", :js => true do
  let(:admin) { User.new(name:"Matthew Tse", password:"3af44c4k", 
                         password_confirmation:"3af44c4k", email:"matt.s.tse@gmail.com") }

   before do
      visit signin_path
      fill_in "Email", with: admin.email
      fill_in "Password", with: admin.password
      click_button "Sign in"
    end

    it { should have_selector('h1', text: 'New Post')}


  end

  describe "regular users should not be able to make new posts", :js => true  do
    let(:user) { FactoryGirl.create(:user)}
    before do
      visit signin_path
      fill_in "Email", with: user.email
      fill_in "Password", with: user.password
      click_button "Sign in"
    end
    it { should have_selector('div.alert.alert-error', text: admin_error)}
  end




 
  
end
