namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    User.create!(name: "Matthew Tse",
                 password: "3af44c4k",  
		 password_confirmation: "3af44c4k",
		 email: "matt.s.tse@gmail.com")

    User.create!(name: "Batman", password: "asdf",	
		   password_confirmation: "asdf",
		   email: "batman@gmail.com")	
    matt = User.first
    10.times do
      title= Faker::Lorem.sentence(1)
      content = Faker::Lorem.sentence(50)
      matt.posts.create!(content: content, title: title)
    end   
  end
end