require 'spec_helper'

describe Comment do
  let(:user) {FactoryGirl.create(:user)}
  let(:post) {FactoryGirl.create(:post, user: user)}
  before do
    @comment = user.comments.build(content: "post content", post_id:post.id)
  end
  

  subject { @comment }
  it {should respond_to(:content)}
  it { should respond_to(:post_id)}
  it {should respond_to(:post)}
  it { should respond_to (:user)}
  its(:user) { should==user}
  it { should be_valid}

end
