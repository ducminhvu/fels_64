require 'csv'
CSV.foreach "db/sample_db_categories.csv", headers: true do |row|
  Category.create! row.to_hash
end

CSV.foreach "db/sample_db_words.csv", headers: true do |row|
  Word.create! row.to_hash
end

CSV.foreach "db/sample_db_answers.csv", headers: true do |row|
  Answer.create! row.to_hash
end

User.create!(username:  "Admin",
             email: "admin@admin.com",
             password:              "abc123",
             password_confirmation: "abc123",
             admin: true)
50.times do |n|
  name  = Faker::Name.name
  email = "test-#{n+1}@test.com"
  password = "abc123"
  User.create!(username: name,
              email: email,
              password:              password,
              password_confirmation: password)
end

users = User.all
user  = users.first
following = users[2..20]
followers = users[3..20]
following.each {|followed| user.follow(followed)}
followers.each {|follower| follower.follow(user)}
