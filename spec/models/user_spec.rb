require 'spec_helper'

describe User do

  before { @user = User.new(name: "Matthew Tse", password: "foobar")}

  subject { @user}

  it { should respond_to(:name)}
  it { should respond_to(:password_digest)}
  it {should respond_to(:password)}

  describe "return value of authenticate method" do
    before { @user.save }
    let(:first_user) { User.first}

    describe "with valid password" do
      it { should == first_user.authenticate(@user.password)}
    end

    describe "with invalid password" do
      let(:user_for_invalid_password) {first_user.authenticate("invalid")}

      it { should_not == user_for_invalid_password}
      specify { user_for_invalid_password.should be_false}
    end
  end
end
