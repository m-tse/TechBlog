FactoryGirl.define do

  factory :user do
    name     "Joe Schmo"
    password "asdfasdf"
    password_confirmation "asdfasdf"
    email "joe@schmo.com"
  end

  factory :post do
    content "Post content"
    title "Post Title"
    user
  end


end
