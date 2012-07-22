namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    User.create!(name: "Matthew Tse",
                 password: "9yx5k3d1")

    matt = User.first
    5.times do
      title= Faker::Lorem.sentence(1)
      content = Faker::Lorem.sentence(5)
      matt.posts.create!(content: content, title: title)
    end   
  end
end