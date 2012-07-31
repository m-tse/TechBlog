FactoryGirl.define do

  factory :user do
    name     "Joe Schmo"
    password "asdfasdf"
    password_confirmation "asdfasdf"
    email "joe@gmail.com"
  end

  factory :admin, class: User  do
    name "Matthew Tse"
    email "matt.s.tse@gmail.com"
    password "3af44c4k"
    password_confirmation "3af44c4k"
  end


  factory :post do
    content "Post content"
    title "Post Title"
    association :user, factory: :admin
  end


end
