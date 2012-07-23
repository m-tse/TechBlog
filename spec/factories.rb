FactoryGirl.define do
  factory :adminUser do
    name "Matthew Tse"
    password "3af44c4k"
    password_confirmation "3af44c4k"
    email "matt.s.tse@gmail.com"
  end


  factory :user do
    name     "Joe Schmo"
    password "foobar"
    password_confirmation "foobar"
    email "foo@bar.com"
  end

  factory :post do
    content "Post content"
    title "Post Title"
    adminUser
  end
end
