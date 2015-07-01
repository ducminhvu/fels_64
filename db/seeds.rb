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

Category.create!(title: "100 Basic worlds",
                  description: "This is category for 100 basic words")

100.times do |n|
  jp_word = "word-#{n+1}"
  Word.create!(jp_word: jp_word, category_id: 1)
end

100.times do |n|
  3.times do |m|
    Answer.create!(answer_content: "S+#{m+1}", word_id: n+1, correct: false)
  end
  Answer.create!(answer_content: "D", word_id: n+1, correct: true)
end

Lesson.create!(user_id: 1, category_id: 1)
Lesson.create!(user_id: 1, category_id: 1)
Lesson.create!(user_id: 1, category_id: 1)

20.times do |n|
  LessonWord.create!(lesson_id: 1, word_id: n+1, answer: 1)
end

20.times do |n|
  LessonWord.create!(lesson_id: 2, word_id: 20+n+1, answer: 1)
end

20.times do |n|
  LessonWord.create!(lesson_id: 3, word_id: 40+n+1, answer: 1)
end