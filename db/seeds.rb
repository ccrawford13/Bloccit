require "faker"
#Create Users
# 5.times do
#   user = User.new(
#     name:       Faker::Name.name,
#     email:      Faker::Internet.email,
#     password:   Faker::Lorem.characters(10)
#   )
#   user.skip_confirmation!
#   user.save!
# end
# users = User.all

admin = User.new(
  name:                  'Admin User',
  email:                 'admin@example.com',
  role:                  'admin',
  password:              'helloworld',
  password_confirmation: 'helloworld'
  )
admin.skip_confirmation!
admin.save

moderator = User.new(
  name:                  'Mod User',
  email:                 'mod@example.com',
  role:                  'moderator',
  password:              'helloworld',
  password_confirmation: 'helloworld'
  )
moderator.skip_confirmation!
moderator.save

member = User.new(
  name:                  'Member User',
  email:                 'member@example.com',
  role:                  'member',
  password:              'helloworld',
  password_confirmation: 'helloworld'
  )
member.skip_confirmation!
member.save

users = User.all 

#Create 50 Posts
#Note: by calling 'User.new' instead of 'create'.
#we create an instance of User which isn't immediately saved to the database
#The 'save' method then saves this User to the database.

50.times do
  Post.create!(
    user: users.sample,
    title: Faker::Lorem.sentence,
    body: Faker::Lorem.paragraph
  )
end
posts = Post.all

# Create Comments
100.times do
  Comment.create!(
    post: posts.sample,
    body: Faker::Lorem.paragraph
  )
end


puts "Seed finished"
puts "#{admin}"
puts "#{moderator}"
puts "#{member}"
puts "#{User.count} users created"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"


