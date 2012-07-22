FactoryGirl.define do
  factory :user do
    name     "Matthew Tse"
    password "3af44c4k"
  end

  factory :micropost do
    content "Post content"
    title "Post Title"
    user
  end
end
