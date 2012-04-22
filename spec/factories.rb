Factory.define :user do |user|
  user.name                   "Neil Kamireddy"
  user.email                  "neil.kamireddy+factorygirl@gmail.com"
  user.password               "testpassword"
  user.password_confirmation  "testpassword"
end

Factory.define :project do |project|
  project.title "test title"
  project.body "test body"
  project.association :user  
end
  
Factory.define :thought do |thought|
  thought.content "test thought"
  thought.association :project
end  