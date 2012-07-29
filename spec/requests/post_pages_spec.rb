require 'spec_helper'

describe "Post pages" do

  subject { page }
  let(:admin_error) {"Only a signed in admin user can work with posts!"}

  let(:user) { FactoryGirl.create(:user)}

  describe "admin user should be able to put up a post" do
    let(:admin) { User.new(name:"Matthew Tse", password:"3af44c4k", 
                           password_confirmation:"3af44c4k", email:"matt.s.tse@gmail.com") }

   before do
      sign_in(admin)

    end

    it { should have_selector('h1', text: 'New Post')}

  end

  describe "regular users should not be able to make new posts" do
    before do
      sign_in(user)
      visit new_post_path
    end
    it { should have_selector('div.alert.alert-error', text: admin_error)}
  end




 
  
end
