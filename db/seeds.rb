require "faker"
#Create Users
5.times do
  user = User.new(
    name:       Faker::Name.name,
    email:      Faker::Internet.email,
    password:   Faker::Lorem.characters(10)
  )
  user.skip_confirmation!
  user.save!
end
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

Advertisement.create!(
  title: 'Support Bloccit',
  copy: "New Copy",
  price: 500
  )

user = User.first
user.skip_reconfirmation!
user.update_attributes!(
  email: 'ccrawforduwlax@gmail.com',
  password: 'password'
)

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"


