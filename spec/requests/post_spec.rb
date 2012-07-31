require 'spec_helper'

describe "For Posts," do

  subject { page }
  describe "sign in with admin information" do
    let(:user) {FactoryGirl.create(:admin)}

    before { sign_in(user) }


    it { should have_link('Sign Out', href: signout_path)}
    
    describe "visit new_post_path," do
      before do
        visit new_post_path
      end
      
      it {should have_selector('h1', text:'New Post')}
      
      
      describe "create new post," do
        let(:post_title) {"a post title"}
        let(:post_contents) {"a post's contents"}
        before do
          fill_in "post_title", with: post_title
          fill_in "post_content", with: post_contents
          click_button "Post"
        end
        
        it {should have_selector('h3', text: post_title)}
        it {should have_selector('p', text: post_contents)}
        
        describe "then delete post" do
          before do
            
            within("li.postElement") do
              click_link "Delete Post"
            end
          end
          it {should_not have_selector('h3', text: post_title)}
          it { should_not  have_selector('p', text: post_contents)}
          
        
        end
      end
    end
  end
end
