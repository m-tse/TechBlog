require 'spec_helper'

describe "For Comments," do
  let(:post) {FactoryGirl.create(:post)}
  subject { page}
  describe "sign in as normal user" do
    let(:user) {FactoryGirl.create(:user)}

    before do
      sign_in(user)



    end



  end
end
