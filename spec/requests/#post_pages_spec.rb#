require 'spec_helper'
require 'pp'

describe "Post pages" do

  subject { page }
  let(:admin_error) {"Only a signed in admin user can work with posts!"}

  let(:user) { FactoryGirl.create(:user)}
  let(:admin) { User.new(name:"Matthew Tse", password:"3af44c4k", 
                         password_confirmation:"3af44c4k", email:"matt.s.tse@gmail.com") }

  describe "admin user should be able to put up a post" do


   before do
      visit signin_path
      fill_in "Email", with: admin.email
      fill_in "Password", with: admin.password
      click_button "Sign in"
    end

    it { should have_selector('brand', text: 'Admin')}


  end

  describe "regular users should not be able to make new posts" do
    before do
      sign_in(user)
      visit new_post_path
    end
    it { should have_selector('div.alert.alert-error', text: admin_error)}
  end




 
  
end
