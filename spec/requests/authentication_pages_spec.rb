require 'spec_helper'

describe "AuthenticationPages" do

  subject { page }

  describe "signin page" do
    before { visit signin_path }

    it { should have_selector('h1', text: 'Sign in')}
    it { should have_selector('title', text: 'Sign in')}
  end

  describe "signin" do
    let(:user) { FactoryGirl.create(:user)}
     before do 
      visit signin_path
      @post = user.posts.build(content: "Lorem ipsum", title: "NEW POST")
    end

    describe "with invalid information" do
      before { click_button "Sign in"}

      it { should have_selector('title', text: 'Sign in')}
      it { should have_selector('div.alert.alert-error', text: 'Invalid')}

      describe "after visiting another page" do
        before { click_link "Home" }
        it { should_not have_selector('div.alert.alert-error')}
      end

    end

    describe "with valid information" do
      let(:user) { FactoryGirl.create(:user)}
      before do
        fill_in "Email", with: user.email
        fill_in "Password", with: user.password
        click_button "Sign in"
      end

      it { should have_link('Sign out', href: signout_path)}
      it { should_not have_link('Signin', href: signin_path)}

      describe "followed by signout" do
        before { click_link "Sign out" }
        it { should_not have_selector('h1', text: "Admin Mode")}
        it { should_not have_selector('li', text: "Sign out")}
      end
    end


  end

end
