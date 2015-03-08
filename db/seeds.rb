require "faker"

# Create 50 Posts

50.times do
  Post.create!(
    title: Faker::Lorem.sentence,
    body: Faker::Lorem.paragraph
  )
end

if Post.exists?(title: 'Unique Post')
   puts "That post currently exists in database"
else
  Post.create!(
    title: "Uniques Post",
    body: "Unique body"
    )
  puts "New Post Created"
end
  
posts = Post.all

if Comment.exists?(body: 'Unique comment')
  puts "That comment currently exists in database"
else
  Comment.create!(
    post: posts.sample,
    body: "Uniques comment"
    )
  puts "New Comment Created"
end

# Create Comments
100.times do
  Comment.create!(
    post: posts.sample,
    body: Faker::Lorem.paragraph
  )
end

puts puts "Seed finished"
puts "#{Post.count} posts in the database"
puts "#{Comment.count} Comments in the database"