require "faker"

#Create 50 Posts

50.times do
  Post.create!(
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

puts "Seed finished"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"
puts "#{Advertisement.count} Ads created"
