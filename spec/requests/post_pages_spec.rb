require 'spec_helper'

describe "Post pages" do

  subject { page }

  let(:user) { FactoryGirl.create(:user) }

  describe "should not be accessible to non admin users" do
    before { visit new_post_path}
    it {should_not have_content('post')}
  end



  before { sign_in user }

  describe "micropost creation" do
    before { visit root_path }

    describe "with invalid information" do

      it "should not create a micropost" do
        expect { click_button "Post" }.should_not change(Post, :count)
      end

      describe "error messages" do
        before { click_button "Post" }
        it { should have_content('error') } 
      end
    end

    describe "with valid information" do

      before do
        fill_in 'micropost_content', with: "Lorem ipsum" 
      end
      it "should create a micropost" do
        expect { click_button "Post" }.should change(Post, :count).by(1)
      end
    end
  end
end
