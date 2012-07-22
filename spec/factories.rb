FactoryGirl.define do
  factory :user do
    name     "Matthew Tse"
    password "foobar"
    password_confirmation "foobar"
    email "matt.s.tse@gmail.com"
  end

  factory :post do
    content "Post content"
    title "Post Title"
    user
  end
end
