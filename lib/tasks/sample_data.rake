namespace :db do
  desc "Fill database with sample data"
  task :populate => :environment do
    Rake::Task['db:reset'].invoke
    User.create!(:name => "Neil Kamireddy",
                 :email => "neil.kamireddy@gmail.com",
                 :password => "testpassword",
                 :password_confirmation => "testpassword")
    User.all.each do |user|
      user.projects.create!(:title => "This is a project title", :body => "And here's some body text!")
    end  
  end
end