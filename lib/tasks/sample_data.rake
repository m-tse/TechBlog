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
    matt = User.find_by_email("matt.s.tse@gmail.com")
    batman = User.find_by_email("batman@gmail.com")
	
    10.times do
      title= Faker::Lorem.sentence(1)
      content = Faker::Lorem.sentence(400)
      apost = matt.posts.create!(content: content, title: title)

      2.times do
        commentContent = Faker::Lorem.sentence(20)
	batman.comments.create!(content:commentContent, post_id:apost.id)
      end
    end   
    
    contenthash = {"resume_education"=>"Education!!", "resume_work_experience"=>"Work Experience!!", "resume_projects"=>"projects!!", "about_me"=>"ABOUT ME!!", "contact_me"=>"CONTACT ME!!!", "projects"=>"projects!!!!!!!"}
    contenthash.each_pair do |k,v|
      PageContent.create!(name:k, content:v)
    end


  end
end
