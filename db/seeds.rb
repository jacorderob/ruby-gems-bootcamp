# frozen_string_literal: true

User.create!(
  email: 'admin@example.com',
  password: 'admin1',
  password_confirmation: 'admin1'
)

30.times do
  Course.create(
    title: Faker::Educator.course_name,
    description: Faker::TvShows::GameOfThrones.quote,
    user: User.first,
    short_description: Faker::Quote.famous_last_words,
    language: Faker::ProgrammingLanguage.name,
    level: 'Beginner',
    price: Faker::Number.between(from: 1000, to: 20_000)
  )
end
